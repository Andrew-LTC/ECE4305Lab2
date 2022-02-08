`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2022 02:31:58 PM
// Design Name: 
// Module Name: mux_2x1_nbit
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


module mux_2x1_nbit
    #(parameter N = 4)(
    input logic [N-1:0] w0, w1,
    input logic s,
    output logic [N-1:0] f
    );
    
    always_comb
    begin
        begin
            case(s)
                1'b0: f = w0;
                1'b1: f = w1;
                default: f = 'bx;
            endcase
        end
    end
endmodule
