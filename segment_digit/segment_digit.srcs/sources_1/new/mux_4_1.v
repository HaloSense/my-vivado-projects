`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/24 15:45:59
// Design Name: 
// Module Name: mux_4_1
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

module mux_4_1(
    input wire [5:0] in_0,
    input wire [5:0] in_1,
    input wire [5:0] in_2,
    input wire [5:0] in_3,
    input wire [1:0] sel,
    output wire [5:0] out
    );
    
assign out = sel[1] ? (sel[0] ? in_3 : in_2) : (sel[0] ? in_1 : in_0);  

endmodule
