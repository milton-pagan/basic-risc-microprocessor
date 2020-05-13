/* 	
	ICOM4215 S20 PROJECT
	TESTER FOR ALU
	
	Group:
		Dionel Mart�nez, dionel.martinez@upr.edu (Author)
		Milton E. Pag�n, milton.pagan1@upr.edu
*/
`include "src/modules/data_path/alu.v"
module alu_test;

	// Inputs
	reg [4:0] op; 					// Operations Register
	reg signed [31:0] A,B;			// Operands
	reg Cin;						// Input Carry
	
	// Outputs
	wire signed [31:0] result;		// Result of Operation
	wire C,N,V,Z;					// Condition Codes

	// ALU Initialization
	alu alu(A,B,Cin,op,result,C,N,V,Z);

	initial #500 $finish;			// Simulation Time
	
	// Starting Test
	initial $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--STARTING ALU TEST--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|");

	// Testing operations w/o overflow
	initial $display("\n|--------------------------------------------------------------TESTING OPERATIONS W/O OVERFLOW--------------------------------------------------------------|");
	
		// Testing Z-flag
	initial fork
		A = 32'b0;
		B = 32'b0;
		Cin = 1'b1;
		op = 4'b100;
	join
	
	initial #10 fork
		A = 32'b1010011;
		B = 32'b1100101;
	join
	
	initial #25 repeat (23) #10 
		fork
			A += 32'b1010;	
			B += 32'b101;
			op += 4'b1;
		join
	
	// Testing overflow in addition
	initial #270 $display("\n|----------------------------------------------------------------TESTING OVERFLOW IN ADDITION---------------------------------------------------------------|\n");

	initial #300 begin
		A = 32'b01111111_11111111_11111111_11111101;			
		B = 32'b10;
		op = 4'b100;
	end
	
	initial #310 repeat (1) #10 A += B;

	// Testing overflow in subtraction
	initial #350 $display("\n|---------------------------------------------------------------TESTING OVERFLOW IN SUBTRACTION-------------------------------------------------------------|\n");

	initial #360 begin
		A = 32'b10000000_00000000_00000000_00000010;			
		B = 32'b10;
		op = 4'b10;
	end
	
	initial #400 repeat (1) #5 A -= B;
	
	// Results Output
	initial begin
		$display("\n OPER \t  A(dec) \t      A(bin) \t\t\t B(dec) \t      B(bin) \t\t   Result(dec) \t\t    Result(bin)           C  N  V  Z");
		$monitor("  %d %d  %b  %d  %b  %d  %b  %b  %b  %b  %b",op,A,A,B,B,result,result,C,N,V,Z);
	end
	
	//Test Finished
	initial #420 $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--ALU TEST FINISHED--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");

endmodule