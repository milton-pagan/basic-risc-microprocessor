CC = iverilog 

test: src/modules/*.v src/tests/*.v
	@$(CC) -o bin/tests/test src/modules/*.v src/tests/*.v
	@echo "Running tests...\n"
	@./bin/tests/test

