CLANG := clang
SRC := gzip-1.2.4a.ll
gzip: $(SRC)
	$(CLANG) $+ -o $@
	
TEST_IDS := test-help
.PHONY: test $(TEST_IDS)

test: $(TEST_IDS)

$(TEST_IDS): test%: gzip
	./gzip --help || true
	mv tea.log tea.$@.log