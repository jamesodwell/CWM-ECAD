//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:James Odwell
// Date:17/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	wire red;
	wire amber;
	wire green;
	reg [2:0] current;
	reg [2:0] previous;
	reg err;

//Generate clock
	initial
	 begin
	  clk = 1'b1;
	  forever
	   #(CLK_PERIOD/2) clk = ~clk;
	 end

//user logic

	initial begin
	  err=0;
	  previous = current;
	  #1
	  forever begin
	    #(2*CLK_PERIOD)

	  if ((current==3'b001||current==3'b011||current==3'b100||current==3'b010)==0) begin
	      $display("***Test Failed***");
	      err=1;
	    end

	    else begin
	      if ( ((previous==3'b001) && (current!=3'b011)) || ((previous==3'b011) && (current!=3'b100)) || ((previous==3'b100) && (current!=3'b010)) || ((previous==3'b010) &&(current!=3'b001)) )
	      begin
		$display("***Test Failed*** Incorrect sequence");
		err=1;
	      end
	    end 

	  previous = current;
	  current[0] = red;
	  current[1] = amber;
	  current[2] = green;
	  end 

	end 

    initial begin
	#200
	if (err==0)
	 $display("***TEST PASSED!***");
	$finish;
    end

traffic top (
  .clk (clk),
  .red (red),
  .amber (amber),
  .green (green)
  );
endmodule
