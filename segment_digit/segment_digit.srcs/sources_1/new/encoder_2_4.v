`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/22 02:58:59
// Design Name: 
// Module Name: encoder_2_4
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

module encoder_2_4(
    input wire [1:0] A,
    output wire [3:0] Y
    );

// 2-bit to 4-bit encoder
// Effective on low level
assign Y[3] = A[1] | A[0];
assign Y[2] = A[1] | ~A[0];
assign Y[1] = ~A[1] | A[0];
assign Y[0] = ~A[1] | ~A[0];

endmodule
