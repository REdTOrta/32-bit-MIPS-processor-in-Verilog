module and_gate(a, b, out);

	input a,b;
	output reg out;

	always@(*)
		out = a&b;

endmodule