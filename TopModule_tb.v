`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 07:59:13 PM
// Design Name: 
// Module Name: TopModule_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopModule_tb;
    reg clk;               // Clock 
    reg reset;             // Reset 
    wire [6:0] segments;   // Output
    wire [3:0] anodes;     // Output


    TopModule uut (
        .clk(clk),
        .reset(reset),
        .segments(segments),
        .anodes(anodes)
    );

 
    always #5 clk = ~clk;

    initial begin
      
        clk = 0;
        reset = 1;
       
        #30 reset = 0;

        #1000;

        reset = 1;
        #20 reset = 0;

        
        #2000 $stop;
    end
endmodule
