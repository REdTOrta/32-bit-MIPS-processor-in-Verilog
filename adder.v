module adder(a, b, out);
	input [32-1:0] a, b ;
	output reg [32-1:0] out;

	always@(*)
		out = a+b;

endmodule
