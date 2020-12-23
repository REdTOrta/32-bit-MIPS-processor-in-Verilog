module Datamemory(Address, Writedata, Readdata, MemWrite, clk);

	input [32-1:0] Address, Writedata;
	input MemWrite, clk;
	output [32-1:0] Readdata;

	reg [32-1:0] register_memory[1024-1:0];

	initial
		$readmemb("memory.mem", register_memory);

	assign Readdata = register_memory[Address>>2];

	always@(posedge clk)
		if (MemWrite == 1)
			register_memory[Address>>2] = Writedata;







endmodule