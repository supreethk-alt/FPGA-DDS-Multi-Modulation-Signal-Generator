`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 10:58:24
// Design Name: 
// Module Name: mux_phase_inc
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


module mux_phase_inc(
    input  [23:0] base_inc,
    input  [23:0] fm_phase,
    input  [23:0] lfm_phase,
    input  [1:0]  sel,
    output reg [23:0] phase_inc
);

always @(*) begin
    case(sel)
        2'b00: phase_inc = base_inc;   // AM
        2'b01: phase_inc = fm_phase;   // FM
        2'b10: phase_inc = base_inc;   // PM
        2'b11: phase_inc = lfm_phase;  // LFM
        default: phase_inc = base_inc;
    endcase
end

endmodule
