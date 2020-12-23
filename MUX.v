module MUX_32bit (out, a, b, sel);

	input [32-1:0] a, b;
	output reg [32-1:0] out;

	input sel;

	always@(a, b, sel) begin

		case(sel)
		1'b0 : out = b;
		1'b1 : out = a;
		endcase
		end
endmodule

module MUX_5bit (out, a, b, sel);

	input [5-1:0] a, b;
	output reg [5-1:0] out;

	input sel;

	always@(a, b, sel) begin

		case(sel)
		1'b0 : out = b;
		1'b1 : out = a;
		endcase
		end
endmodule
