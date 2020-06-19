//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:James Odwell
// Date:19/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

module tt(
	input clk,
	input read,
	input [2:0]a,
	input [2:0]b,
	output [5:0]result
	);

blk_mem_gen_0 tt_mem (
	.clka(clk),
	.ena(read),
	.wea(1'b0),
	.addra({a,b}),
	.dina(6'h0),
	.douta(result)
	);

endmodule
