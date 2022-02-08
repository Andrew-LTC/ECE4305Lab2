`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2022 02:27:06 PM
// Design Name: 
// Module Name: tri_state_buffer_nbit
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


module tri_state_buffer_nbit
    #(parameter N = 8)(
    input logic en,
    input logic [N-1:0] a,
    output logic [N-1:0] b
    );

    assign b = (en) ? a : 'bz;
    
endmodule
