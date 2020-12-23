module sl2 (in, out);

	input [32-1:0] in;
	output [32-1:0] out;

	assign out = {in[29:2], 2'b00};

endmodule

module sl2_26bit (in, out);

	input [26-1:0] in;
	output [28-1:0] out;

	assign out = {in[25:0], 2'b00};

endmodule