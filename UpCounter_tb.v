`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 07:59:39 PM
// Design Name: 
// Module Name: UpCounter_tb
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


module tb_UpCounter;

    // Input
    reg clk;
    reg reset;

    // Output
    wire [11:0] count;

    
    UpCounter #(.MAX_COUNT(12'd15)) uut ( 
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Test 
    initial begin
        
        reset = 1;
        #20;
        reset = 0;
  // Wait for several clock cycles to observe counting
        #300;
        reset = 1;
        #10;
        reset = 0;

        #100;

        $stop;
    end

 

endmodule
