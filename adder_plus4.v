module adder_plus4(in, out);

	input [32-1:0] in;
	output reg [32-1:0] out;

	always@(*)
		out = in + 4;

endmodule