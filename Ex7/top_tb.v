//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: James Odwell
// Date: 19/06/2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb(
);

parameter clk_period = 10;
reg clk, read; 
reg [2:0] a; 
reg [2:0] b;
wire [5:0] result;

initial begin
	clk = 1'b0;
	forever
	#(clk_period/2)clk = ~clk; 		
	end

initial begin
	read = 0;	 
	a = 0; 
	b = 0;					
	#(10*clk_period)
	read = 1;
	forever begin
		#(2*clk_period) 				
		$display("a=%d b=%d result=%d", a, b, result);
		a=a+1;
		b=(a==0)?b+1:b;
		end
		end

tt tt(.clk(clk), .a(a), .b(b), .read(read), .result(result)); 

endmodule
