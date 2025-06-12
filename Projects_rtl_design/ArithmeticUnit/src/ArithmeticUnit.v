//The Arithmetic Unit 

module Arithmetic_Unit#(parameter OPCODE_L = 8, OPERAND_L = 32, RES_L = 32)(
	input  wire clk,
	input  wire rst, 
	input  wire [OPCODE_L-1 : 0] Opcode,
	input  wire [OPERAND_L-1 : 0] Operand1,
	input  wire [OPERAND_L-1 : 0] Operand2,
	output wire [RES_L-1 : 0] Result);
	
	//Register Declaration
	reg [RES_L-1 :0] res_ff, res_reg;

	
	//Combinational Circuit
	always@(*) begin
		case(Opcode[1:0])
			'b00: begin 
				//Addition
				res_reg = Operand1 + Operand2;
			end 
			'b01: begin 
				//Subtraction
				res_reg = Operand1 - Operand2;
			end 
			'b10: begin 
				//Multplication 
				res_reg = Operand1 * Operand2;
			end 
			'b11: begin 
				//Divison to avoid zero division error
				if( Operand2 != 0) res_reg = Operand1 / Operand2;
				else res_reg = 0;
			end 
			default : begin
				res_reg = 0;
			end 
		endcase
	end 
	
	//Sequential Circuit
	always@(posedge clk) begin
		if(rst) begin 
			res_ff <= 0;
		end else begin 
			res_ff <= res_reg;
		end 
	end 
	
	assign Result = res_ff;
	
endmodule

/*NOTE:
1. For systhesis Optimization in FPGA I use + during addition, - during subtraction 
2. Efficient Div and Mul algorithm must be found 

*/


