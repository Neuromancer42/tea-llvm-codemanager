int foo(int x) {
    return x + 1;
}
struct bbbb{
    int a;
    float c;
};
int testt = 0;
int aaaa = 2;
struct aaaa{
    int a;
    int b;
    float c;
    double d;
    int * e;
    struct bbbb f;
    double k[114];
};
int main() {
    int a = 0;
    int b = foo(a);
    float c = 1;
    double d = 2;
    struct aaaa e;
    e.k[1] = 0.1;
    struct aaaa f[2];
    f[0].k[2] = 0.2;
    struct aaaa * g = f;
    g[1].k[3] = 1.3;
    int h[b];
    return b;
}