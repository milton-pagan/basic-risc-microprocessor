/* 	
	ICOM4215 S20 PROJECT
	ALU Implementation
	
	Group:
		Dionel Martínez, dionel.martinez@upr.edu (Author)
		Milton E. Pagán, milton.pagan1@upr.edu
*/

module alu(	input [31:0] A,B,				// 32-bit Inputs
			input Cin,						// Carry-In
			input [4:0] operation,			// 16 distinc operations
			output reg [31:0] result,		// 32-bit Output
			output reg C,N,V,Z);			// Condition Codes

	// Initialization
	reg [32:0] temp;
	initial begin C=1'b0; N=1'b0; V=1'b0; Z=1'b0; end

	/* 
	The distinct operations are specified below.
	Operations that involve only one operand, A is selected default.
	*/
	parameter [4:0] 
					AND 		= 5'b00000,		
					XOR 		= 5'b00001,		
					SUB 		= 5'b00010,		
					ISUB 		= 5'b00011,		
					ADD 		= 5'b00100,				
					ADDC 		= 5'b00101,		
					SUBNC 		= 5'b00110,	
					ISUBNC 		= 5'b00111,
					TST			= 5'b01000,
					TEQ			= 5'b01001,
					CMP			= 5'b01010,
					CMN			= 5'b01011,
					ORR			= 5'b01100,
					PASS_B 		= 5'b01101,
					BIC			= 5'b01110,
					NOTB 		= 5'b01111,	
					PASS_A 		= 5'b10000,			
					AP4 		= 5'b10001,			
					MSUM4 		= 5'b10010;			
				
	always @ (A,B,Cin,operation)
	begin
		case(operation)
			ADD:
			begin
				result = A + B;
				temp = {1'b0, A} + {1'b0, B};
				C = temp[32];
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
		
			ADDC:
			begin
				result = A + B + {31'b0,Cin};
				temp = {1'b0, A} + {1'b0, B} + {32'b0, Cin};
				C = temp[32];
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			SUB:
			begin
				result = A - B;
				temp = {1'b0, A} - {1'b0, B};
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			AND:
			begin
				result = A & B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end
			
			ORR:
			begin
				result = A | B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end
			
			XOR:
			begin
				result = A ^ B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end

			PASS_A:
			begin
				result = A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end
			
			ISUB:
			begin
				result = B - A;
				temp = {1'b0, B} - {1'b0, A};
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			SUBNC:
			begin
				result = A - B - ~{31'b0,Cin};
				temp = {1'b0, A} - {1'b0, B} - ~{32'b0, Cin};
				C = 1'b0;
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end

			ISUBNC:
			begin
				result = B - A - ~{31'b0,Cin};
				temp = {1'b0, B} - {1'b0, A} - ~{32'b0, Cin};
				C = 1'b0;
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			PASS_B:
			begin
				result = B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end

			BIC:
			begin
				result = A & ~B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end

			NOTB:
			begin
				result = ~B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end

			AP4:
			begin
				result = A + 32'b100;
				temp = {1'b0, A} + 33'b100;
				C = temp[32];
				V = A[31] != result[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end

			MSUM4:
			begin
				result = A + B + 32'b100;
				temp = {1'b0, A} + {1'b0, B} + 33'b100;
				C = temp[32];
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			TST:
			begin
				//result = A & B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end

			TEQ:
			begin
				//result = A ^ B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				V = 1'b0;
			end

			CMP:
			begin
				//result = A - B;
				temp = {1'b0, A} - {1'b0, B};
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;	
			end

			CMN:
			begin
				//result = A + B;
				temp = {1'b0, A} + {1'b0, B};
				C = temp[32];
				V = A[31] == B[31] && result[31] != A[31];
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
		endcase		
	end
	
endmodule