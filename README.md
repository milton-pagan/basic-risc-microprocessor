# Basic RISC Microprocessor
Implementation of a basic RISC microprocessor based on ARM architecture. A course project for ICOM4215 (Computer Architecture).

## Usage
A makefile is included that simplifies compiling and running test modules.

To compile and run all tests in the src/tests directory do:  
`make test`

To compile and run a specific test file in the tests directory do:  
`make test-one test=test_name.v`

Can also use clean target to delete compiled binaries in bin directory:  
`make clean`
