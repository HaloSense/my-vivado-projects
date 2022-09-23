`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/22 12:55:09
// Design Name: 
// Module Name: segment_main
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

`default_nettype none

module segment_main(
    input wire clk,
    
    // Reset
    input wire rst,
    
    // Enable
    input wire en,
    
    // Mode switch
    // 1 = binary encode, 0 = button encode
    input wire mode,
    
    // LED mode indicator
    output wire mode_led,
    
    // Switches as binary input
    input wire [7:0] binary,
    
    // Button inputs
    input wire [4:0] btns,
    
    // Segment display output
    output reg [3:0] segs,
    
    // Segment selection output
    output reg [1:0] seg_sel
    
    );
    
// Binary to BCD encode

// Declare intermediate regs
reg [3:0] hundreds;
reg [3:0] tens;
reg [3:0] ones;

integer i;

always@(binary or mode)
begin
    if(mode == 1) begin
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
        
        for (i = 7; i >= 0; i = i - 1)
        begin
            // Add 3 to columns >= 5
            if(hundreds >= 5)
                hundreds = hundreds + 3;
            if(tens >= 5)
                tens = tens + 3;
            if(ones >= 5)
                ones = ones + 3;
            
            // Shift left 1 bit
            hundreds = hundreds << 1;
            hundreds[0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = binary[i];
        end
    end
    else begin
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
    end
end
    
            
            



endmodule
