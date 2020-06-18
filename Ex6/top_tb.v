//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

//Parameters
parameter CLK_PERIOD = 10;

//Registers and wires
reg rst;
reg clk;
reg button;
reg sel;
reg sel2;
wire [2:0] result;
reg [2:0] result2;
reg err;

//Generate clocks
initial begin
	clk = 1'b1;
	forever
	#(CLK_PERIOD/2) clk = ~clk;
	end

initial begin
	rst = 1;
	#(CLK_PERIOD) rst = 0;
	#(10*CLK_PERIOD) rst = 1;
	#(CLK_PERIOD) rst = 0;
	end

initial begin
	button = 0;
	#CLK_PERIOD button = 1;
	#(10*CLK_PERIOD) button = 0;
	#(CLK_PERIOD) button = 1;
	end

initial begin;
	sel = 1'b1;
	forever
	#(5*CLK_PERIOD) sel = ~sel;
	end

//user logic
initial begin
	err=0;
	#1
	forever begin
	#CLK_PERIOD
		if (result==1'bX) begin
		$display("***Test Failed***");
		err=1;
	      	end

	      	if (sel==1&&sel2==1) begin
			if ((result==3'b001||result==3'b011||result==3'b100||result==3'b010)==0) begin
			$display("***Test Failed*** Traffic lights wrong");
			err=1;
			end
		else begin
	      		if ( ((sel2==3'b001) && (sel!=3'b011)) || ((sel2==3'b011) && (sel!=3'b100)) || 			((sel2==3'b100) && (sel!=3'b010)) || ((sel2==3'b010) &&(sel!=3'b001)) )
	      		begin
			$display("***Test Failed*** Incorrect sequence");
			err=1;
	      		end
	    	end 
	      	end

		if (sel==0&&sel2==0) begin
		if (rst==1) 
			if (result!=3'b001) begin
	 		$display("***Test Failed*** didn't reset properly");
           		err=1;
			end
		else if ( (result!=3'b000)||(result!=3'b111) ) begin
	        	if ((button==0)&&(result2!=result)) begin
		  	$display("***Test Failed*** Throw changed when button is 0");
	    	  	err=1;
	       		end
	      	end

	      	if ((button==1)&&(result2==result)) begin
	        $display("***Test Failed*** Throw doesn't change when button is 1");
		err=1;
	      	end
	    
	      	if ((button==1)&&(result2==3'b001)&&(result!=3'b010)) begin
		$display("***Test Failed*** Throw doesn't move in correct sequence");
		err=1;
	      	end
		end 
	sel2=sel;
	result2=result;
	end 
end 

//Finish test, check for success
initial begin
	#200
	if (err==0)
	$display("***TEST PASSED!***");
	$finish;
end

//Instantiate combined multiplexer module
DiceTrafficMux top (
    .clk (clk),
    .rst (rst),
    .button (button),
    .sel (sel),
    .result (result)
    );

endmodule
