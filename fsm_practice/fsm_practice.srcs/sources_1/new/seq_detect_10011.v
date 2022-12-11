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
    reg [4:0] state = 5'b00000;
    reg [4:0] next_state = 5'b00000;
    
    // local parameters for states (one-hot)
    parameter [4:0] s0 = 5'b00001;
    parameter [4:0] s1 = 5'b00010;
    parameter [4:0] s2 = 5'b00100;
    parameter [4:0] s3 = 5'b01000;
    parameter [4:0] s4 = 5'b10000;
    
    // state transition
    always@(posedge clk or posedge rst)
    begin
        if(rst == 1) state <= s0;
        else state <= next_state;
    end
    
    // determine the next state and output
    always@(in or state or rst)
    begin
        if(rst == 1) begin
            next_state = s0;
            out = 0;
        end
        else case(state)
                s0: begin
                        out = 0;
                        if(in == 1) next_state = s1;
                        else next_state = s0;
                    end
                s1: begin
                        out = 0;
                        if(in == 0) next_state = s2;
                        else next_state = s1;
                    end
                s2: begin
                        out = 0;
                        if(in == 0) next_state = s3;
                        else next_state = s1;
                    end
                s3: begin
                        out = 0;
                        if(in == 1) next_state = s4;
                        else next_state = s0;
                    end
                s4: begin
                        if(in == 1) begin
                            next_state = s1;
                            out = 1;
                        end
                        else begin
                            next_state = s2;
                            out = 0;
                        end
                    end
                default: begin
                            next_state = s0;
                            out = 0;
                         end
             endcase
    end
endmodule
