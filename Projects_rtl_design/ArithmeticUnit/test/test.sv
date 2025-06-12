//Test.sv

module test;
	//PARAMETERS
	localparam OPCODE_L = 2;
	localparam OPERAND_L = 32;
	localparam RES_L = 32;
	localparam TOTAL_OPERATIONS = 4;
	localparam TOTAL_WIDTH = $clog2(TOTAL_OPERATIONS);
	
	//Signal Declaration 
	logic clk;
	logic rst;
	logic [OPCODE_L-1 : 0]  Opcode;
	logic [OPERAND_L-1 : 0] Operand1;
	logic [OPERAND_L-1 : 0] Operand2;
	logic [RES_L-1 : 0]     Result;
	
	
	//DUT instantiation 
	Arithmetic_Unit #(
    	.OPCODE_L(OPCODE_L),
    	.OPERAND_L(OPERAND_L),
    	.RES_L(RES_L)
  	) dut (
    	.clk(clk),
    	.rst(rst),
    	.Opcode(Opcode),
    	.Operand1(Operand1),
    	.Operand2(Operand2),
    	.Result(Result)
  	);
	
	//Testbench Logic 
	always #5 clk = ~clk;
	
	initial begin 
		//Initialize All registers to Zero
		clk = 'b0;
		rst = 'b0;
		Opcode = 'b0;
		Operand1 = 'b0;
		Operand2 = 'b0;
	end 
	
	initial begin 
		//Stimulus - reset
		#10 rst = 1;
		#10 rst = 0;
	end 
	
        initial begin
   	 	$dumpfile("outputd/dump.vcd");
    		$dumpvars(0, test);
  	end

	initial begin 
		//Input Stimulus Logic sending 
		
		//Addition
		#30 
		send_instruction(0, 20, 20);
		#30
		result_check(Result, 40);
		
		//Subtraction
		#30 
		send_instruction(1, 20, 20);
		#30
		result_check(Result, 0);
		
		//Multiplication
		#30 
		send_instruction(2, 20, 20);
		#30
		result_check(Result, 400);
		
		//Divison
		#30 
		send_instruction(3, 20, 20);
		#30
		result_check(Result, 1);		
		
		#50 
		$finish;
	end 
	
	task send_instruction(input [TOTAL_WIDTH-1:0] choice, input [OPERAND_L-1 : 0] Operand_1, input [OPERAND_L-1 : 0] Operand_2);
		//Send input Stimulus
		case(choice)
			'd0: begin 
				Opcode = 'b00;
				Operand1 = Operand_1;
				Operand2 = Operand_2;
			end 
			'd1: begin
				Opcode = 'b01;
				Operand1 = Operand_1;
				Operand2 = Operand_2;
			end 
			'd2: begin
				Opcode = 'b10;
				Operand1 = Operand_1;
				Operand2 = Operand_2;
			end 
			'd3: begin
				Opcode = 'b11;
				Operand1 = Operand_1;
				Operand2 = Operand_2;
			end 
			default: begin
				Opcode = 0;
				Operand1 = 0;
				Operand2 = 0;
			end 
		endcase
	endtask
	
	task result_check(input [RES_L-1 : 0] Res_obtained, input [RES_L-1 : 0] Res_expected);
		//Result Checking Function 
		if(Res_obtained == Res_expected) begin 
			$display("CORRECT!");
		end else begin 
			$display("NOT CORRECT!");
		end 
	endtask 
	
endmodule 
