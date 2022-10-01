`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/24 15:47:47
// Design Name: 
// Module Name: counter_2bit
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

module counter_2bit(
    input wire clk,
    input wire rst,
    output reg [1:0] count
    );

initial begin
    count <= 2'b00;
end

always@(posedge clk or posedge rst)
    if(rst == 1) 
        count <= 2'b00;
    else
        count <= count + 1;
endmodule
