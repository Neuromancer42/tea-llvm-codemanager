#include "irmanager_instr.h"
#include "instr_factory.h"
#include "instr_examples/ci_IM.inc"
#include "instr_examples/reachableM.inc"
#include <fstream>

using namespace std;
using namespace tea;
int main(int argc, char** argv) {
    if (argc < 3) {
        cerr << "Usage: " << argv[0] << " <bitcode file>" << " <workdir>" << endl;
        return 1;
    }
    string filename(argv[1]);
    string workdir(argv[2]);
    string ldflags;
    for (int i = 3; i < argc; ++i) {
        ldflags.append(" ").append(argv[i]);
    }
    cout << "Parsing file: " << filename << endl;
    cout << "Setting workdir: " << workdir << endl;
    cout << "linker flags:" << ldflags << endl;
    filesystem::create_directories(workdir);

    // parsing IR from file
    cout << "Using LLVM version: " << LLVM_VERSION_STRING << endl;
    llvm::LLVMContext ctx;
    llvm::SMDiagnostic diag;

    auto irm = unique_ptr<IRManager_Instr>(IRManager_Instr::createFromFile(filename, diag, ctx, workdir, ldflags));

    // get information from IR module
    cout << "Parsed module: " << irm->get_name() << endl;

    irm->build_doms();
    irm->build_rels();
    irm->save_all();
    ifstream dom_P_ifs;
    filesystem::path dom_P_loc = filesystem::path(workdir) / "P.map";
    cout << "Opening: " << dom_P_loc << endl;
    dom_P_ifs.open(dom_P_loc);
    string p_str;
    vector<string> dom_P;
    while (getline(dom_P_ifs, p_str)) {
        cout << p_str << endl;
        dom_P.push_back(p_str);
    }
    dom_P_ifs.close();
    ifstream dom_M_ifs;
    filesystem::path dom_M_loc = filesystem::path(workdir) / "M.map";
    cout << "Opening: " << dom_M_loc << endl;
    dom_M_ifs.open(dom_M_loc);
    string m_str;
    vector<string> dom_M;
    while (getline(dom_M_ifs, m_str)) {
        cout << m_str << endl;
        dom_M.push_back(m_str);
    }
    dom_M_ifs.close();
    vector<pair<string, vector<int>>> queries;
    for (int m_id = 1; m_id <= dom_M.size(); ++m_id) {
        if (dom_M[m_id-1].find("main") != string::npos) {
            cout << "skip " << dom_M[m_id-1] << endl;
            continue;
        }
        queries.emplace_back("reachableM", initializer_list<int>{m_id});
        for (int p_id = 1; p_id <= dom_P.size(); ++p_id) {
            queries.emplace_back("ci_IM", initializer_list<int>{p_id, m_id});
        }
    }
    for (auto & instr_pair : InstrFactory::factory_map) {
        irm->register_instr(instr_pair.first, instr_pair.second->create(irm.get()));
        cout << "Registered instr: " << instr_pair.first << endl;
    }
    map<string, ProgramDom> dom_map;
    dom_map.emplace("P", "P").first->second.load(filesystem::path(workdir));
    dom_map.emplace("M", "M").first->second.load(filesystem::path(workdir));

    for (auto & q : queries) {
        bool succ = irm->handle_instrument_req(q.first, q.second, dom_map);
        if (succ) {
            cout << "instrumented:\t" << q.first;
            for (auto & e : q.second) {
                cout << "\t" << e;
            }
            cout << endl;
        }
    }
    vector<pair<string, vector<int>>> triggered, negated;
    irm->handle_test_req({}, triggered, negated);
    for (auto & t : triggered) {
        cout << "triggered:\t" << t.first;
        for (auto & e : t.second) {
            cout << "\t" << e;
        }
        cout << endl;
    }
    for (auto & t : negated) {
        cout << "negated:\t" << t.first;
        for (auto & e : t.second) {
            cout << "\t" << e;
        }
        cout << endl;
    }
    return 0;
}