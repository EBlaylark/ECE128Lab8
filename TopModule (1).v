`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 07:57:28 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule (
    input wire clk,              // clock
    input wire reset,            // Reset 
    output wire [6:0] segments,  // Seven-segment 
    output wire [3:0] anodes     
);
    wire [11:0] count;           // from UpCounter
    wire [15:0] bcd;             // from BinToBcd
    wire ready;                  // Ready signal from BinToBcd



    UpCounter counter (
        .clk(clk),
        .reset(reset),
        .count(count)
    );


    BinToBcd converter (
        .clk(clk),
        .reset(reset),
        .start(1'b1), 
        .binary(count),
        .bcd(bcd),
        .ready(ready)
    );

   
    DisplayDriver display (
        .clk(clk),
        .reset(reset),
        .bcd(bcd),
        .segments(segments),
        .anodes(anodes)
    );
endmodule
