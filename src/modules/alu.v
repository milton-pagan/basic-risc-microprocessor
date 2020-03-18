/* 	
	ICOM4215 S20 PROJECT
	ALU Implementation
	Group:
		Dionel Martínez, dionel.martinez@upr.edu
		Milton E. Pagán, milton.pagan1@upr.edu

*/

module ALU(	input [31:0] A,B,				// 32-bit Inputs
			input Cin,						// Carry-In
			input [3:0] operation,			// 16 distinc operations
			output reg [31:0] result,		// 32-bit Output
			output reg C,N,V,Z);			// Condition Codes

	// Initialization
	reg [32:0] temp;
	initial begin C=1'b0; N=1'b0; V=1'b0; Z=1'b0; end

	/* 
	The distinct operations are specified below.
	Operations that involve only one operand, A is selected default.
	*/
	parameter [3:0] ADD = 4'b0,				// addition
					ADDC = ADD + 4'b1,		// addition with carry
					SUB = ADDC + 4'b1,		// subtraction
					AND = SUB + 4'b1,		// logical and
					NAND = AND + 4'b1,		// logical nand
					OR = NAND + 4'b1,		// logical or
					NOR = OR + 4'b1,		// logical nor
					XOR = NOR + 4'b1,		// logical xor
					XNOR = XOR + 4'b1,		// logical xnor
					LSL = XNOR + 4'b1,		// logical shift left
					LSR = LSL + 4'b1,		// logical shift right
					RL = LSR + 4'b1,		// rotate left
					RR = RL + 4'b1,			// rotate right
					NOT = RR + 4'b1,		// logical not
					TwoC = NOT + 4'b1,		// Two's Complement
					REM = TwoC + 4'b1;		// Bits Appear Unmodified
				
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
				result = A + B + {31'b1,Cin};
				temp = {1'b0, A} + {1'b0, B} + {31'b0, Cin};
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
			end
			
			AND:
			begin
				result = A & B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			NAND:
			begin
				result = ~(A & B);
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			OR:
			begin
				result = A | B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			NOR:
			begin
				result = ~(A | B);
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			XOR:
			begin
				result = A ^ B;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			XNOR:
			begin
				result = ~(A ^ B);
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			LSL:
			begin
				result = A << 1;
				C = A[31]; 
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			LSR:
			begin
				result = A >> 1;			
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			RL:
			begin
				result = {A[30:0], A[31]};			
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			RR:
			begin
				result = {A[0], A[31:1]};			
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			NOT:
			begin
				result = ~A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			TwoC:
			begin
				result = 32'b0 - A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			REM:
			begin
				result = A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
		endcase		
	end
	
endmodule