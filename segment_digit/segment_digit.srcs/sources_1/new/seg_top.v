`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/24 15:57:52
// Design Name: 
// Module Name: seg_top
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

module seg_top(

    // inputs
    // clock
    input wire CLK100MHZ,
    // switches
    input wire [15:0] sw,
    // buttons
    input wire btnC,
    input wire btnU,
    input wire btnL,
    input wire btnR,
    input wire btnD,
    
    // outputs
    // leds
    output wire [15:0] LED,
    // segments
    output wire [6:0] seg,
    output wire dp,
    // digit select
    output wire [3:0] an
    
    );
    
// Wire global reset
wire rst_global;
wire en_global;
assign rst_global = sw[15];
assign en_global = sw[14];

// connect binary with select module
wire [5:0] bin2sel_0;
wire [5:0] bin2sel_1;
wire [5:0] bin2sel_2;
wire [5:0] bin2sel_3;

// binary module
segment_bin bin(
    .rst(rst_global),
    .en(en_global),
    .binary(sw[7:0]),
    .segs_0(bin2sel_0),
    .segs_1(bin2sel_1),
    .segs_2(bin2sel_2),
    .segs_3(bin2sel_3)
);

// button module to select module
wire [5:0] btn2sel_0;
wire [5:0] btn2sel_1;
wire [5:0] btn2sel_2;
wire [5:0] btn2sel_3;

// button module
segment_button button(
    .btnC(btnC),
    .btnU(btnU),
    .btnL(btnL),
    .btnR(btnR),
    .btnD(btnD),
    .segs_0(btn2sel_0),
    .segs_1(btn2sel_1),
    .segs_2(btn2sel_2),
    .segs_3(btn2sel_3)
);

// 2-bit select signal
wire [1:0] select_dgt;

// counter module
counter_2bit counter(
    .clk(CLK100MHZ),
    .rst(rst_global),
    .count(select_dgt)
);

// mode selector to mux
wire [5:0] sel2mux_0;
wire [5:0] sel2mux_1;
wire [5:0] sel2mux_2;
wire [5:0] sel2mux_3;

// mode selector
mode_input_sel selector(
    .mode(en_global),
    .sel_a_0(bin2sel_0),
    .sel_a_1(bin2sel_1),
    .sel_a_2(bin2sel_2),
    .sel_a_3(bin2sel_3),
    .sel_b_0(btn2sel_0),
    .sel_b_1(btn2sel_1),
    .sel_b_2(btn2sel_2),
    .sel_b_3(btn2sel_3),
    .sel_o_0(sel2mux_0),
    .sel_o_1(sel2mux_1),
    .sel_o_2(sel2mux_2),
    .sel_o_3(sel2mux_3)
);

// segment data
wire [5:0] seg_data;

// 4-1 multiplexer
mux_4_1 mux(
    .in_0(sel2mux_0),
    .in_1(sel2mux_1),
    .in_2(sel2mux_2),
    .in_3(sel2mux_3),
    .sel(select_dgt),
    .out(seg_data)
);

// 2-4 encoder to digit control
encoder_2_4 encoder(
    .A(select_dgt),
    .Y(an)
);

// segment data driver
segment_driver seg_driver(
    .dp(dp),
    .seg_data_in(seg_data),
    .seg_data_out(seg)
);


endmodule
