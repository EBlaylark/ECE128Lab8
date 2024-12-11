`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 07:58:29 PM
// Design Name: 
// Module Name: BinToBcd_tb
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


module BinToBCD_tb;
    reg clk;
    reg reset;
    reg start;
    reg [11:0] binary;
    wire [15:0] bcd;
    wire ready;

    
    BinToBCD uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .binary(binary),
        .bcd(bcd),
        .ready(ready)
    );

    // Clock 
    always #5 clk = ~clk;

    initial begin
       
       
       
       
        clk = 0;
        reset = 1;
        start = 0;
        binary = 0;

      
      
      
        #10;
        reset = 0;

        // Test
        binary = 12'b010100110011; 
        start = 1;
        #10;
        start = 0;

       
        wait (ready);
     

        // Test  
        #20;
        binary = 12'b100000000000;// 2048
        start = 1;
        #10;
        start = 0;

 
      
        wait (ready);
        

        // Test 
        #20;
        binary = 12'b000000000000; // 0
        start = 1;
        #10;
        start = 0;
  
        wait (ready);
    
        // Test 
        #20;
        binary = 12'b111111111111; // 4095
        start = 1;
        #10;
        start = 0;

        wait (ready);
        

        
        #20;
        binary = 12'b001100110011; // Binary for decimal 819
        start = 1;
        #5;
        start = 0;
        wait (ready); 

        $stop;
    end
endmodule
