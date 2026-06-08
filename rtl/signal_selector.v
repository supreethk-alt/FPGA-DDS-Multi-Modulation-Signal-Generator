`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 20:04:45
// Design Name: 
// Module Name: signal_selector
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


module signal_selector (
    input  wire [15:0] am,
    input  wire [15:0] fm,
    input  wire [15:0] pm,
    input  wire [15:0] lfm,
    input  wire [1:0] sel,
    output reg  [15:0] signal_out
);

always @(*) begin
    case (sel)
        2'b00: signal_out = am;
        2'b01: signal_out = fm;
        2'b10: signal_out = pm;
        2'b11: signal_out = lfm;
        default: signal_out = 16'd0;
    endcase
end

endmodule