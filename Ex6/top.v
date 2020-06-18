//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: James Odwell
// Date: 18/06/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module DiceTrafficMux(input rst, clk, button, sel,
	output [2:0] result);

wire [2:0] throw;
wire red;
wire amber;
wire green;
wire [2:0] traffic;

dice dice_out(
    	.clk (clk),
    	.rst (rst),
    	.button (button),
    	.throw (throw[2:0])
    	);

traffic traffic_out (
     	.clk (clk),
     	.red (red),
     	.amber (amber),
     	.green (green)
     	);

mux multiplexer (
    	.a (throw[2:0]),
    	.b (traffic[2:0]),
    	.sel (sel),
    	.out (result[2:0])
    	);

assign traffic[0] = red;
assign traffic[1] = amber;
assign traffic[2] = green;

endmodule


