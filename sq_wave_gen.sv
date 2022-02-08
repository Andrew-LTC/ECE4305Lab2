`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2022 02:37:04 PM
// Design Name: 
// Module Name: sq_wave_gen
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


module sq_wave_gen(
    input logic [3:0] M, N,
    input logic clk, reset,
    output logic sq_wave
    );
    
    logic [3:0] timeIn;
    logic fin, tOut;
    
    mux_2x1_nbit #(.N(4)) mux (
        .w0(M),
        .w1(N),
        .s(tOut),
        .f(timeIn)
    );
    
    timer_ns #(.N(4)) timer (
        .clk(clk),
        .reset(reset),
        .en(1'b1),
        .x(timeIn),
        .fin(fin)
    );
    
    t_ff TFF (
        .t(fin),
        .clk(clk),
        .reset(reset),
        .q(tOut)
    );
    
    tri_state_buffer_nbit #(.N(1)) TSBUFF (
        .en(|({M , N})),
        .a(~tOut),
        .b(sq_wave)
    );
endmodule
