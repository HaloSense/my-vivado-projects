`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 02:36:53 PM
// Design Name: 
// Module Name: seq_detect_10011
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

module seq_detect_10011(
    input wire clk,
    input wire rst,
    input wire in,
    output reg out
    );
    
    // state indicator reg
    reg [2:0] state = 3'b000;
    reg [2:0] next_state = 3'b000;
    
    // local parameters for states
    localparam [2:0] s0 = 3'b000;
    localparam [2:0] s1 = 3'b001;
    localparam [2:0] s2 = 3'b010;
    localparam [2:0] s3 = 3'b011;
    localparam [2:0] s4 = 3'b100;
    
    // state transition
    always@(posedge clk)
    begin
        state <= next_state;
    end
    
    // determine the next state
    always@(in, state)
    begin
        case(state)
            s0: if(in == 1) next_state = s1;
                else next_state = s0;
            s1: if(in == 0) next_state = s2;
                else next_state = s0;
            s2: if(in == 0) next_state = s3;
                else next_state = s0;
            s3: if(in == 1) next_state = s4;
                else next_state = s0;
            s4: next_state = s0;
            default: next_state = s0;
        endcase
    end
    
    // output logic
    always@(posedge clk)
    begin
        
    end       
    
    
endmodule
