//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:James Odwell
// Date:17/06/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module traffic(
	input clk,
	output reg red,
	output reg amber,
	output reg green
  );

  //add registers and wires
	reg [2:0] current;

  //add user logic

	always @ (posedge clk)
	  begin
	  current[0]<=red;
	  current[1]<=amber;
	  current[2]<=green;

	  if (current==3'b001) 
	  begin
	    red<=1;
	    amber<=1;
	    green<=0;
	  end
	else begin
	  if (current==3'b011)
	  begin
	    red<=0;
	    amber<=0;
	    green<=1;
	  end

	    else begin
	      if (current==3'b100)
	       begin
	       red<=0;
	       amber<=1;
	       green<=0;
	       end

	      else begin
	 	if (current==3'b010)
	 	begin
		 red<=1;
	   	 amber<=0;
		 green<=0;
	  	end

		else begin
		 red<=1;
		 amber<=0;
	  	 green<=0;
	  	end
	      end 
	    end
	 end 

	end 

endmodule
