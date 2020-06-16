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

//Todo: User logic
	initial 
	begin
	err = 0;
	throw2 = throw;
		forever 
		begin
		#CLK_PERIOD
		
		if (rst==1)
			if (throw!=3'b000) begin
	 		$display("***Test Failed*** didn't reset properly");
           		err=1;
			end
		else 	
		

		
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
