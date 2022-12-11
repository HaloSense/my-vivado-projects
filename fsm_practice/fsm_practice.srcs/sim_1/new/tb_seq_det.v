`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 20:34:23
// Design Name: 
// Module Name: tb_seq_det
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

module tb_seq_det();
    
    // test ports
    reg t_in, t_clk, t_rst;
    wire t_out;
    
    // file ports
    reg f_in, f_out, f_rst;
    integer r, fp;
    
    seq_detect_10011 dut(
        .in(t_in),
        .out(t_out),
        .clk(t_clk),
        .rst(t_rst)  
    );
    
    initial begin
        // read in file
        fp = $fopen("seq_det_10011_cases.csv","r");
        
        // if file not read
        if(fp == 0) begin
            $display("Failed to read file.");
            $stop;
        end
        
        // intialize clock
        t_clk = 0;
        #10
        
        while(!$feof(fp)) begin
            r = $fscanf(fp, "%b,%b,%b", f_in, f_rst, f_out);
            
            // transfer the values
            t_in = f_in;
            t_rst = f_rst;
            
            // flip the clock
            t_clk = 1;
            #10;
            t_clk = 0;
            #10;
            
            // Check output
            if(t_out != f_out) begin
                $display("Output incorrect at time %t.", $time);
                $display("Desired: out = %b, actual: out = %b", f_out, t_out);
                $stop;
            end
        end
        
        // close file and output success message
        $fclose(fp);
        $display("All test cases passed");
        $stop;
    end

endmodule
