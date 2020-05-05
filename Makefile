CC = iverilog 
FLAGS = 

MODULES_DIR = src/modules
TESTS_DIR = src/tests
BINARIES_DIR = bin

test: $(TESTS_DIR)/*.v
	@echo "\033[0;31mRunning tests...\033[0m"
	@for test in $^; do \
		binary_name=`echo $$test | sed 's/src\/tests\///' | sed 's/.v//'`;\
		$(CC) $(FLAGS) -o bin/tests/$$binary_name $$test;\
		vvp bin/tests/$$binary_name;\

test-one: $(TESTS_DIR)/*.v
	@echo "\033[0;31mRunning test...\033[0m"
	@	binary_name=`echo $$test | sed 's/src\/tests\///' | sed 's/.v//'`;\
		$(CC) $(FLAGS) -o bin/tests/$$binary_name $(TESTS_DIR)/$$test;\
		vvp bin/tests/$$binary_name;\

clean: 
	@rm $(BINARIES_DIR)/modules/* $(BINARIES_DIR)/tests/* -f

