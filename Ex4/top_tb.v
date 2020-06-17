//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:James Odwell
// Date:16/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	reg rst;
	reg button;
	wire [2:0] throw;
	reg [2:0] throw2;
	reg err;

//Todo: Clock generation
	initial
    	begin
       	clk = 1'b0;
       	forever
        #(CLK_PERIOD/2) clk=~clk;
     	end

	initial 
	begin
	rst = 1;
	#(CLK_PERIOD) rst = 0;
	end

	initial begin
	  button = 0;
	  #CLK_PERIOD button = 1;
	  #(9*CLK_PERIOD) button = 0; 
	  #(2*CLK_PERIOD) button = 1;
	end

//Todo: User logic
	initial 
	begin
	err = 0;
	throw2 = throw;
		forever 
		begin
		#CLK_PERIOD
		
		if (rst==1)
			if (throw!=3'b001) begin
	 		$display("***Test Failed*** didn't reset properly");
           		err=1;
			end
		else if ( (throw!=3'b000)||(throw!=3'b111) ) begin
	        if ((button==0)&&(throw2!=throw)) begin
		  $display("***Test Failed*** Throw changed when button is 0");
	    	  err=1;
	       	end
	      	end

	      	if ((button==1)&&(throw2==throw)) begin
	        $display("***Test Failed*** Throw doesn't change when button is 1");
		err=1;
	      	end
	    
	      	if ((button==1)&&(throw2==3'b001)&&(throw!=3'b010)) begin
		$display("***Test Failed*** Throw doesn't move in correct sequence");
		err=1;
	      	end 
		end	
	end

//Finish test, check for success
    initial begin
	#200
	if (err==0)
	$display("***TEST PASSED!***");
	$finish;
    end

//Instantiate counter module
dice top (
  .clk (clk),
  .rst (rst),
  .button (button),
  .throw (throw)
  );

endmodule
