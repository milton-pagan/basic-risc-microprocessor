/* 	
	ICOM4215 S20 PROJECT
	ALU Implementation
	
	Group:
		Dionel Mart�nez, dionel.martinez@upr.edu (Author)
		Milton E. Pag�n, milton.pagan1@upr.edu
*/

module ALU(	input [31:0] A,B,				// 32-bit Inputs
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
	parameter [4:0] ADD = 5'b0,				// 0 addition
					ADDC = ADD + 5'b1,		// 1 addition with carry
					SUB = ADDC + 5'b1,		// 2 subtraction
					AND = SUB + 5'b1,		// 3 logical and
					NAND = AND + 5'b1,		// 4 logical nand
					OR = NAND + 5'b1,		// 5 logical or
					NOR = OR + 5'b1,		// 6 logical nor
					XOR = NOR + 5'b1,		// 7 logical xor
					XNOR = XOR + 5'b1,		// 8 logical xnor
					LSL = XNOR + 5'b1,		// 9 logical shift left
					LSR = LSL + 5'b1,		// 10 logical shift right
					RL = LSR + 5'b1,		// 11 rotate left
					RR = RL + 5'b1,			// 12 rotate right
					NOTA = RR + 5'b1,		// 13 logical not
					TwoC = NOTA + 5'b1,		// 14 Two's Complement
					AREM = TwoC + 5'b1,		// 15 A's bits Appear Unmodified

					// Added after Happy Hour

					ISUB = AREM + 5'b1,		// 16 B - A
					MSUBNC = ISUB + 5'b1,	// 17 A - B - (not Cin)
					IMSUBNC = MSUBNC + 5'b1,// 18 B - A - (not Cin)
					BREM = IMSUBNC + 5'b1,	// 19 B's bits Appear Unmodified
					ANDNB = BREM + 5'b1,	// 20 A and (not B)
					NOTB = ANDNB + 5'b1,	// 21 not B
					AP4 = NOTB + 5'b1,		// 22 A + 4
					MSUM4 = AP4 + 5'b1;		// 23 A + B + 4


				
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
			
			NAND:
			begin
				result = ~(A & B);
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
			
			NOR:
			begin
				result = ~(A | B);
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
			
			XNOR:
			begin
				result = ~(A ^ B);
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			LSL:
			begin
				result = A << 1;
				C = A[31]; 
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			LSR:
			begin
				result = A >> 1;
				C = A[0];				
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			
			RL:
			begin
				result = {A[30:0], A[31]};			
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			RR:
			begin
				result = {A[0], A[31:1]};			
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			NOTA:
			begin
				result = ~A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			TwoC:
			begin
				result = 32'b0 - A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			
			AREM:
			begin
				result = A;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end
			// TODO

			ISUB:
			begin
				result = B - A;
				temp = {1'b0, B} - {1'b0, A};
				V = temp[31:0] + {32'b1} < 32'b10000000_00000000_00000000_00000001;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
				C = 1'b0;
			end

			MSUBNC:
			begin
				result = A - B - ~{31'b0,Cin};
				temp = {1'b0, A} - {1'b0, B} - ~{32'b0, Cin};
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end

			IMSUBNC:
			begin
				result = B - A - ~{31'b0,Cin};
				temp = {1'b0, B} - {1'b0, A} - ~{32'b0, Cin};
				C = temp[32];
				V = temp[31:0] > 32'b01111111_11111111_11111111_11111111;
				Z = result == 32'b0;
				N = result[31] == 1'b1;
			end
			BREM:
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
			
		endcase		
	end
	
endmodule