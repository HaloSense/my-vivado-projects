`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/24 14:20:18
// Design Name: 
// Module Name: segment_button
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

module segment_button(

    // Button assignment:
    // 4 = up 3 = down 2 = left 1 = right 0 = middle
    input wire btnC,
    input wire btnU,
    input wire btnL,
    input wire btnR,
    input wire btnD,
    
    output wire [5:0] segs_0,
    output wire [5:0] segs_1,
    output wire [5:0] segs_2,
    output wire [5:0] segs_3
    );
    
wire [4:0] btns;
assign btns = {btnU, btnD, btnL, btnR, btnC};
    
// Digit 0
assign segs_0 =     (btns == 5'b01000) ? 6'd23: // 'n' when down
                    (btns == 5'b00100) ? 6'd29: // 't' when left
                    (btns == 5'b00010) ? 6'd29: // 't' when right
                    (btns == 5'b00001) ? 6'd13: // 'd' when middle
                    6'd63;                      // blank when others

// Digit 1
assign segs_1 =     (btns == 5'b10000) ? 6'd25: // 'P' when up
                    (btns == 5'b01000) ? 6'd32: // 'w' when down
                    (btns == 5'b00100) ? 6'd15: // 'F' when left
                    (btns == 5'b00010) ? 6'd17: // 'H' when right
                    (btns == 5'b00001) ? 6'd18: // 'i' when middle
                    6'd63;
                    
// Digit 2
assign segs_2 =     (btns == 5'b10000) ? 6'd30: // 'U' when up
                    (btns == 5'b01000) ? 6'd24: // 'o' when down
                    (btns == 5'b00100) ? 6'd14: // 'E' when left
                    (btns == 5'b00010) ? 6'd16: // 'G' when right
                    (btns == 5'b00001) ? 6'd22: // 'm' when middle
                    6'd63;
                    
// Digit 3
assign segs_3 =     (btns == 5'b01000) ? 6'd13: // 'd' when down
                    (btns == 5'b00100) ? 6'd21: // 'L' when left
                    (btns == 5'b00010) ? 6'd27: // 'r' when right
                    6'd63;
                        
endmodule
