module Top_MIPS(clk,reset, seg5, seg4, seg3, seg2, seg1, seg0);

	input clk, reset;

	output [6:0] seg0, seg1, seg2, seg3, seg4, seg5;

	wire out_clk;

	wire [32-1:0] newpc, pc, inst, Readdata1, Readdata2, se, se2, outalu, Readdata, add4, ao;

	wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero, ando;
	wire [2-1:0] ALUOp;
	wire [3-1:0] alucontrol;

	wire[5-1:0] w2;
	wire [32-1:0] w4, w3, w0;

	wire [28-1:0] isl;



//////////////////////////module/////////////////////////////////

	clk_dll clk_out(reset, clk, out_clk);
	
	pc PC(.rst(reset), .clk(out_clk), .newpc(newpc), .pc(pc));

	instruction_memory IM(.pc(pc), .inst(inst));

	Control C(.Op(inst[31:26]), .RegDst(RegDst), .Jump(Jump), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
	
 	MUX_5bit M2(w2, inst[15:11], inst[20:16], RegDst);

	Registers R(.Readregister1(inst[25:21]), .Readregister2(inst[20:16]), .Writeregister(w2), .Writedata(w4), .Readdata1(Readdata1), .Readdata2(Readdata2), .RegWrite(RegWrite), .clk(out_clk));
	
	sign_ex SE(inst[15:0], se);

	MUX_32bit M3(w3, se, Readdata2, ALUSrc);

	aludec AC(.func(inst[5:0]), .aluop(ALUOp), .alucontrol(alucontrol));

	alu_mips A(.a(Readdata1), .b(w3), .control(alucontrol), .outalu(outalu), .zero(zero));

	Datamemory DM(.Address(outalu), .Writedata(Readdata2), .Readdata(Readdata), .MemWrite(MemWrite), .clk(out_clk));

	MUX_32bit M4(w4, Readdata, outalu, MemtoReg);



	adder_plus4 AP4(pc, add4);

	sl2_26bit SL0(inst[25:0], isl);

	wire [32-1:0] ja = {add4[3:0], isl};

	MUX_32bit M1(newpc, ja, w0, Jump);

	sl2 SL1(se, se2);

	adder Adder(add4, se2, ao);

	and_gate a(Branch, zero, ando);

	MUX_32bit M0(w0, ao, add4, ando);



	seg7	s5(pc[7:4],seg5),
		s4(pc[3:0],seg4),
		s3(w4[15:12],seg3),
		s2(w4[11:8],seg2),
		s1(w4[7:4],seg1),
		s0(w4[3:0],seg0);
	



endmodule
