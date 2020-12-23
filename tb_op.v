`timescale 1ns/1ns

module tb_op();
reg rst, clk;
reg [31:0] newpc;
wire [31:0] pc;

pc u0(rst, clk, newpc, pc);

initial
begin
rst=0;
#55; rst=1;
end

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
newpc=0;
#65; newpc=3;
#25; newpc=10;
end

endmodule