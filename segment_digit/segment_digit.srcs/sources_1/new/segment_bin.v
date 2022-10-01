
`default_nettype none

module segment_bin(
    
    // Reset
    input wire rst,
    
    // Enable
    input wire en,
    
    // Switches as binary input
    input wire [7:0] binary,
    
    // Segment display output
    output wire [5:0] segs_0,
    output wire [5:0] segs_1,
    output wire [5:0] segs_2,
    output wire [5:0] segs_3
    );
    
// Binary to BCD encode

// Declare intermediate regs
reg [3:0] hundreds;
reg [3:0] tens;
reg [3:0] ones;

// Connect the outputs
assign segs_0 = {2'b00, ones};
assign segs_1 = {2'b00, tens};
assign segs_2 = {2'b00, hundreds};
assign segs_3 = 6'd63;

integer i;

always@(binary or rst)
begin
    if(rst == 1) begin
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
    end
    else if(en == 1) begin
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
        
        for (i = 7; i >= 0; i = i - 1)
        begin
            // Add 3 to columns >= 5
            if(hundreds >= 5)
                hundreds = hundreds + 3;
            if(tens >= 5)
                tens = tens + 3;
            if(ones >= 5)
                ones = ones + 3;
            
            // Shift left 1 bit
            hundreds = hundreds << 1;
            hundreds[0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = binary[i];
        end
    end
end

endmodule
