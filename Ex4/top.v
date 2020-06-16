//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:James Odwell
// Date:16/06/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dice(input clk, rst, button, output reg [2:0] throw);

always @ (*) begin
	if (rst)
	throw<=3'b000;
	else begin
		if (button) begin
	        case (throw)
	        3'b000: throw<=3'b001;
	        3'b001: throw<=3'b010;
	        3'b010: throw<=3'b011;
	        3'b011: throw<=3'b100;
	        3'b100: throw<=3'b101;
	        3'b101: throw<=3'b110;
	        3'b110: throw<=3'b001;
	        3'b111: throw<=3'b001;
	      	endcase
	    	end
		else begin
			if ((throw==3'b000) || (throw==3'b111))
			throw<=3'b001;
			else
			throw<=throw;
		end
		end 
	end 

endmodule


