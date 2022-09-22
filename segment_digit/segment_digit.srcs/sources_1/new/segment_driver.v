`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/22 03:15:46
// Design Name: 
// Module Name: segment_driver
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

module segment_driver(
    input wire [5:0] seg_data_in,
    
    // Output arrangement:
    // {A, B, C, D, E, F, G}
    output wire [7:0] seg_data_out,

    // DP signal
    output wire dp
    );

// Lock DP at high (not effective)
assign dp = 1'b0;

// Assign segment signals accordingly
assign seg_data_out =   (seg_data_in == 6'd0) ? 7'b0000001:    // 0
                        (seg_data_in == 6'd1) ? 7'b1001111:    // 1
                        (seg_data_in == 6'd2) ? 7'b0010010:    // 2
                        (seg_data_in == 6'd3) ? 7'b0000110:    // 3
                        (seg_data_in == 6'd4) ? 7'b1001100:    // 4
                        (seg_data_in == 6'd5) ? 7'b0100100:    // 5
                        (seg_data_in == 6'd6) ? 7'b0100000:    // 6
                        (seg_data_in == 6'd7) ? 7'b0001111:    // 7
                        (seg_data_in == 6'd8) ? 7'b0000000:    // 8
                        (seg_data_in == 6'd9) ? 7'b0000100:    // 9
                        (seg_data_in == 6'd10) ? 7'b0001000:    // A
                        (seg_data_in == 6'd11) ? 7'b1100000:    // b
                        (seg_data_in == 6'd12) ? 7'b0110001:    // C
                        (seg_data_in == 6'd13) ? 7'b1000010:    // d
                        (seg_data_in == 6'd14) ? 7'b0110000:    // E
                        (seg_data_in == 6'd15) ? 7'b0111000:    // F
                        (seg_data_in == 6'd16) ? 7'b0100001:    // G
                        (seg_data_in == 6'd17) ? 7'b1001000:    // H
                        (seg_data_in == 6'd18) ? 7'b1111011:    // i
                        (seg_data_in == 6'd19) ? 7'b1000011:    // J
                        (seg_data_in == 6'd20) ? 7'b1010000:    // K
                        (seg_data_in == 6'd21) ? 7'b1110001:    // L
                        (seg_data_in == 6'd22) ? 7'b0101010:    // M
                        (seg_data_in == 6'd23) ? 7'b1101010:    // n
                        (seg_data_in == 6'd24) ? 7'b1100010:    // o
                        (seg_data_in == 6'd25) ? 7'b0011000:    // P
                        (seg_data_in == 6'd26) ? 7'b0001100:    // q
                        (seg_data_in == 6'd27) ? 7'b1111010:    // r
                        (seg_data_in == 6'd28) ? 7'b1101100:    // s
                        (seg_data_in == 6'd29) ? 7'b1110000:    // t
                        (seg_data_in == 6'd30) ? 7'b1000001:    // U
                        (seg_data_in == 6'd31) ? 7'b1011100:    // v
                        (seg_data_in == 6'd32) ? 7'b1010100:    // W
                        (seg_data_in == 6'd33) ? 7'b1001001:    // X
                        (seg_data_in == 6'd34) ? 7'b1000100:    // y
                        (seg_data_in == 6'd35) ? 7'b0110110:    // Z
                        (seg_data_in == 6'd36) ? 7'b1111110:    // Hyphen '-'
                        7'b1111111;                             // All other cases

endmodule
