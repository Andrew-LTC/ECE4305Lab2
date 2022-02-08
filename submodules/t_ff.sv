`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 11:50:16 AM
// Design Name: 
// Module Name: t_ff
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


module t_ff(
    input logic t, clk, reset,
    output logic q
    );
    
    //signal delcaration
    logic q_next, q_reg;
    
    //register
    always_ff@(posedge clk, posedge reset)
    begin
        if(reset)
            q_reg <= 0;
        else 
            q_reg <= q_next;   
    end
    
    //next state 
    assign q_next = t ? ~q_reg : q_reg;
    
    //output
    assign q = q_reg;
endmodule
