`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 10:59:06
// Design Name: 
// Module Name: mux_phase_offset
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


module mux_phase_offset(
    input  [23:0] pm_phase,
    input  [1:0]  sel,
    output reg [23:0] phase_offset
);

always @(*) begin
    case(sel)
        2'b00: phase_offset = 24'd0;        // AM
        2'b01: phase_offset = 24'd0;        // FM
        2'b10: phase_offset = pm_phase;     // PM ✅
        2'b11: phase_offset = 24'd0;        // LFM
        default: phase_offset = 24'd0;
    endcase
end

endmodule
