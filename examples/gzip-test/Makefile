CLANG := clang
gzip: instrumented.ll instr_funcs.c
	${CLANG} $+ -o $@
	
TEST_IDS := test-help
.PHONY: test $(TEST_IDS)

test: $(TEST_IDS)

$(TEST_IDS): test%: gzip
	./gzip --help || true
	mv tea.log tea.$@.log