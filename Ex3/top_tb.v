//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:James Odwell
// Date:15/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg enable;
	reg direction;
	reg err;
	reg [7:0]counter_out2;
	wire [7:0]counter_out;

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

	initial 
	begin
	enable = 1;
	#(3*CLK_PERIOD) enable = 0;
      	#(10*CLK_PERIOD) enable = 1;
	#(10*CLK_PERIOD) enable = 0;
	end

	initial 
	begin
	direction = 1;
	#(3*CLK_PERIOD) direction = 0;
	#(CLK_PERIOD) direction = 1;
	#(5*CLK_PERIOD) direction = 0;
	#(CLK_PERIOD) direction = 1;
	end
//Todo: User logic
	initial 
	begin
	err = 0;
	counter_out2 = counter_out;
		forever 
		begin
		#CLK_PERIOD
		
		if (enable==0&&rst==0&&(counter_out!=counter_out2)) 
		begin
		$display("***Test Failed*** counting when enable = 0");
		err=1;
		end

		if (rst==1&&counter_out!=0)
		begin
	 	$display("***Test Failed*** didn't reset properly");
           	err=1;
		end

		if (rst==0&&enable==1&&clk==1&&direction==1&&(counter_out2!=counter_out-1)) 
		begin
	 	$display("***Test Failed*** does not count up properly");
	 	err=1;
		end
	 
		if (rst==0&enable==1&&clk==1&&direction==0&&(counter_out2!=counter_out+1))  
		begin
	 	$display("***Test Failed*** does not count down properly"); 
	 	err=1;
		end
		
		counter_out2 = counter_out;
		end
	end

     
//Todo: Finish test, check for success
	initial 
	begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      	end

//Todo: Instantiate counter module
	counter top (
	.clk (clk),
  	.rst (rst),
  	.enable (enable),
  	.direction (direction),
  	.counter_out (counter_out)
  	);

 
endmodule 
