module Control (Op, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

	input [6-1:0] Op;

	output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	output reg [2-1:0] ALUOp;


	always@(Op) begin
		case(Op)
		6'b000000: begin		//R-type
			RegWrite = 1'b1;
			RegDst = 1'b1;
			ALUSrc = 1'b0;
			Branch = 1'b0;
			MemWrite = 1'b0;
			MemtoReg = 1'b0;
			ALUOp = 2'b10;
			Jump = 1'b0;
			MemRead = 1'b0;                                                                                                                                 
			end

		6'b100011: begin		//lw
			RegWrite = 1'b1;
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			Branch = 1'b0;
			MemWrite = 1'b0;
			MemtoReg = 1'b1;
			ALUOp = 2'b00;
			Jump = 1'b0;
			MemRead = 1'b1;                                                                                                                                 
			end

		6'b101011: begin		//sw
			RegWrite = 1'b0;
			RegDst = 1'bx;
			ALUSrc = 1'b1;
			Branch = 1'b0;
			MemWrite = 1'b1;
			MemtoReg = 1'bx;
			ALUOp = 2'b00;
			Jump = 1'b0;
			MemRead = 1'b0;                                                                                                                                 
			end

		6'b000100: begin		//beq
			RegWrite = 1'b0;
			RegDst = 1'bx;
			ALUSrc = 1'b0;
			Branch = 1'b1;
			MemWrite = 1'b0;
			MemtoReg = 1'bx;
			ALUOp = 2'b01;
			Jump = 1'b0;
			MemRead = 1'b0;                                                                                                                                 
			end

		6'b001000: begin		//addi
			RegWrite = 1'b1;
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			Branch = 1'b0;
			MemWrite = 1'b0;
			MemtoReg = 1'b0;
			ALUOp = 2'b00;
			Jump = 1'b0;
			MemRead = 1'b0;                                                                                                                                 
			end

		6'b001101: begin		//ori
			RegWrite = 1'b1;
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			Branch = 1'b0;
			MemWrite = 1'b0;
			MemtoReg = 1'b0;
			ALUOp = 2'b11;
			Jump = 1'b0;
			MemRead = 1'b0;                                                                                                                                 
			end

		6'b000010: begin		//j
			RegWrite = 1'b0;
			RegDst = 1'bx;
			ALUSrc = 1'bx;
			Branch = 1'b0;
			MemWrite = 1'b0;
			MemtoReg = 1'bx;
			ALUOp = 2'bxx;
			Jump = 1'b1;
			MemRead = 1'b0;                                                                                                                                 
			end

		endcase
	end









endmodule
