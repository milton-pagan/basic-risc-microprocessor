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
					AND_F 		= 5'b01000,
					XOR_F		= 5'b01001,
					SUB_F 		= 5'b01010,
					ADD_F 		= 5'b01011,
					OR 			= 5'b01100,
					PASS_B 		= 5'b01101,
					ANDNB 		= 5'b01110,	
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
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
		
			ADDC:
			begin
				result = A + B + {31'b0,Cin};
				temp = {1'b0, A} + {1'b0, B} + {32'b0, Cin};
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			SUB:
			begin
				result = A - B;
				temp = {1'b0, A} - {1'b0, B};
				V = temp[31:0] + {32'b1} < 32'b10000000_00000000_00000000_00000001;
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
			end
			
			OR:
			begin
				result = A | B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			XOR:
			begin
				result = A ^ B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			PASS_A:
			begin
				result = A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			ISUB:
			begin
				result = B - A;
				temp = {1'b0, B} - {1'b0, A};
				V = temp[31:0] + {32'b1} < 32'b10000000_00000000_00000000_00000001;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			SUBNC:
			begin
				result = A - B - ~{31'b0,Cin};
				temp = {1'b0, A} - {1'b0, B} - ~{32'b0, Cin};
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end

			ISUBNC:
			begin
				result = B - A - ~{31'b0,Cin};
				temp = {1'b0, B} - {1'b0, A} - ~{32'b0, Cin};
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			PASS_B:
			begin
				result = B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			ANDNB:
			begin
				result = A & ~B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			NOTB:
			begin
				result = ~B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			AP4:
			begin
				result = A + 32'b100;
				temp = {1'b0, A} + 33'b100;
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end

			MSUM4:
			begin
				result = A + B + 32'b100;
				temp = {1'b0, A} + {1'b0, B} + 33'b100;
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			AND_F:
			begin
				result = A & B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			
			end

			XOR_F:
			begin
				result = A ^ B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
				
			end

			SUB_F:
			begin
				result = A - B;
				temp = {1'b0, A} - {1'b0, B};
				V = temp[31:0] + {32'b1} < 32'b10000000_00000000_00000000_00000001;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;	
			end

			ADD_F: 
			begin
				result = A + B;
				temp = {1'b0, A} + {1'b0, B};
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
		endcase		
	end
	
endmodule