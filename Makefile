CC = iverilog 
FLAGS = -Wall

MODULES_DIR = src/modules
TESTS_DIR = src/tests
BINARIES_DIR = bin

test: $(TESTS_DIR)/*.v
	@echo "\033[0;31mRunning tests...\033[0m"
	@for test in $^; do \
		module=`echo $$test | sed 's/tests/modules/' | sed 's/_test//'`;\
		binary_name=`echo $$test | sed 's/src\/tests\///' | sed 's/.v//'`;\
		$(CC) $(FLAGS) -o bin/tests/$$binary_name $$test $$module;\
		vvp bin/tests/$$binary_name;\
	done

clean: 
	@rm $(BINARIES_DIR)/modules/* $(BINARIES_DIR)/tests/* -f

