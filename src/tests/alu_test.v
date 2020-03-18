/* 	
	ICOM4215 S20 PROJECT
	TESTER FOR ALU
	
	Group:
		Dionel Martínez, dionel.martinez@upr.edu (Author)
		Milton E. Pagán, milton.pagan1@upr.edu
*/

module alu_test;

	// Inputs
	reg [3:0] op; 					// Operations Register
	reg signed [31:0] A,B;			// Operands
	reg Cin;						// Input Carry
	
	// Outputs
	wire signed [31:0] result;		// Result of Operation
	wire C,N,V,Z;					// Condition Codes

	// ALU Initialization
	ALU alu(A,B,Cin,op,result,C,N,V,Z);

	initial #500 $finish;			// Simulation Time
	
	// Starting Test
	initial $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--STARTING TEST--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|");

	// Testing operations w/o overflow
	initial $display("\n|--------------------------------------------------------------TESTING OPERATIONS W/O OVERFLOW--------------------------------------------------------------|");
	
		// Testing Z-flag
	initial fork
		A = 32'b0;
		B = 32'b0;
		Cin = 1'b1;
		op = 4'b0;
	join
	
	initial #10 fork
		A = 32'b1010011;
		B = 32'b1100101;
	join
	
	initial #25 repeat (15) #10 
		fork
			A += 32'b1010;	
			B += 32'b101;
			op += 4'b1;
		join
	
	// Testing overflow in addition
	initial #200 $display("\n|----------------------------------------------------------------TESTING OVERFLOW IN ADDITION---------------------------------------------------------------|\n");

	initial #200 begin
		A = 32'b01111111_11111111_11111111_11111101;			
		B = 32'b10;
		op = 4'b0;
	end
	
	initial #210 repeat (1) #10 A += B;

	// Testing overflow in subtraction
	initial #250 $display("\n|---------------------------------------------------------------TESTING OVERFLOW IN SUBTRACTION-------------------------------------------------------------|\n");

	initial #250 begin
		A = 32'b10000000_00000000_00000000_00000010;			
		B = 32'b10;
		op = 4'b10;
	end
	
	initial #300 repeat (1) #5 A -= B;
	
	// Results Output
	initial begin
		$display("\n OPER \t  A(dec) \t      A(bin) \t\t\t B(dec) \t      B(bin) \t\t   Result(dec) \t\t    Result(bin)            C  N  V  Z");
		$monitor("  %d %d  %b  %d  %b  %d  %b  %b  %b  %b  %b",op,A,A,B,B,result,result,C,N,V,Z);
	end
	
	//Test Finished
	initial #320 $display("\n|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--TEST FINISHED--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|\n");

endmodule