`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 11:56:40
// Design Name: 
// Module Name: tb_design_1_wrapper
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


module tb_design_1_wrapper;

// Inputs
reg clk_in1_0;
reg [1:0] sel_0;

// Outputs
wire CS_0;
wire MOSI_0;
wire SCK_0;

// Instantiate DUT (Device Under Test)
design_1_wrapper uut (
    .CS_0(CS_0),
    .MOSI_0(MOSI_0),
    .SCK_0(SCK_0),
    .clk_in1_0(clk_in1_0),
    .sel_0(sel_0)
);


// 🔁 Clock Generation (100 MHz)
initial begin
    clk_in1_0 = 0;
    forever #5 clk_in1_0 = ~clk_in1_0;  // 10 ns period
end


// 🎛️ Test Stimulus
initial begin

    // Initialize
//    sel_0 = 2'b00;  // AM
//    #20000;

//    sel_0 = 2'b01;  // FM
//    #20000;

    sel_0 = 2'b10;  // PM
    #20000;

//    sel_0 = 2'b11;  // LFM
//    #20000;

//    // Repeat cycle (optional)
//    sel_0 = 2'b00;
//    #20000;

end

endmodule
