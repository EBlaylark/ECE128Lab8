`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 07:56:54 PM
// Design Name: 
// Module Name: DisplayDriver
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


module DisplayDriver (


    input wire clk,               //Clock 
    input wire reset,             //Reset 
    input wire [15:0] bcd,        //16-bit BCD input
    
    
    
    output reg [6:0] segments,    //Seven-segment
    output reg [3:0] anodes       //Anode signals
);





    reg [1:0] digit_select;       // Counter for active digit
    reg [3:0] current_digit;      // Current 4-bit BCD digit
    reg [16:0] clk_divider;       // Clock divider

   
    always @(posedge clk or posedge reset) begin
        if (reset)
            clk_divider <= 0;
        else
            clk_divider <= clk_divider + 1;
    end

    // Digit selector
    always @(posedge clk_divider[16] or posedge reset) begin
        if (reset)
            digit_select <= 0;
        else
            digit_select <= digit_select + 1;
    end

    // Assign 
    always @* begin
        case (digit_select)
            2'b00: begin
                anodes = 4'b1110;   // digit 1
                current_digit = bcd[3:0];  //lsd t
            end
            2'b01: begin
                anodes = 4'b1101;   // digit 2
                current_digit = bcd[7:4];
            end
            2'b10: begin
                anodes = 4'b1011;   // digit 3
                current_digit = bcd[11:8];
            end
            2'b11: begin
                anodes = 4'b0111;   // digit 4
                current_digit = bcd[15:12]; // msd
            end
            default: begin
                anodes = 4'b1111;   // Turn off
                current_digit = 4'b0000;
            end
        endcase
    end

    //Segment decoder
    always @* begin
        case (current_digit)
            4'd0: segments = 7'b1000000; 
            4'd1: segments = 7'b1111001; 
            4'd2: segments = 7'b0100100; 
            4'd3: segments = 7'b0110000; 
            4'd4: segments = 7'b0011001; 
            4'd5: segments = 7'b0010010; 
            4'd6: segments = 7'b0000010; 
            4'd7: segments = 7'b1111000; 
            4'd8: segments = 7'b0000000; 
            4'd9: segments = 7'b0010000; 
            default: segments = 7'b1111111; 
        endcase
    end

endmodule
