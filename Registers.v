module Registers (Readregister1, Readregister2, Writeregister, Writedata, Readdata1, Readdata2, RegWrite, clk);

	input [5-1:0] Readregister1, Readregister2, Writeregister;
	input [32-1:0] Writedata;
	input RegWrite, clk;
	output [32-1:0] Readdata1, Readdata2;

	reg [32-1:0] RegisterCell [0:32-1];

	always@(posedge clk) begin
		if (RegWrite == 1)
			RegisterCell[Writeregister] = Writedata;
		end

	assign Readdata1 = RegisterCell[Readregister1];
	assign Readdata2 = RegisterCell[Readregister2];




endmodule
