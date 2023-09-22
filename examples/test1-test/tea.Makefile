CLANG := clang
SRC := test1.ll
instrumented: $(SRC)
	$(CLANG) $+ -o $@
	
TEST_IDS := test1 test2 test3 test4
.PHONY: test $(TEST_IDS)

test: $(TEST_IDS)

$(TEST_IDS): test%: instrumented
	./instrumented || true
	mv tea.log tea.$@.log