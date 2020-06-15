//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:James Odwell
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
	input a,
 	input b, 
	input sel, 
	output reg out
    );
    
    //Todo: define registers and wires here


    //Todo: define your logic here    
	always@(*)
	if(sel)
	#5 out <= b;
	else
	#5 out <= a;            
      
endmodule
