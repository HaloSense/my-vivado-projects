`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/24 15:31:22
// Design Name: 
// Module Name: mode_input_sel
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

module mode_input_sel(
    input wire mode,
    input wire [5:0] sel_a_0,
    input wire [5:0] sel_a_1,
    input wire [5:0] sel_a_2,
    input wire [5:0] sel_a_3,
    input wire [5:0] sel_b_0,
    input wire [5:0] sel_b_1,
    input wire [5:0] sel_b_2,
    input wire [5:0] sel_b_3,
    output wire [5:0] sel_o_0,
    output wire [5:0] sel_o_1,
    output wire [5:0] sel_o_2,
    output wire [5:0] sel_o_3
    );
    
    
// mode = 1, binary mode
// mode = 0, button mode
assign sel_o_0 = (mode == 1) ? {sel_a_0} : {sel_b_0};
assign sel_o_1 = (mode == 1) ? {sel_a_1} : {sel_b_1};
assign sel_o_2 = (mode == 1) ? {sel_a_2} : {sel_b_2};
assign sel_o_3 = (mode == 1) ? {sel_a_3} : {sel_b_3};

endmodule
