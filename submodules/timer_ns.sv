`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 04:00:45 PM
// Design Name: 
// Module Name: timer_ns
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


module timer_ns
    #(parameter N = 4)(
    input logic clk, reset, en,
    input logic [N-1:0] x,
    output logic fin
    );
    
    //singal declaration
    logic [2*N-1:0] r_reg, r_next;  //since we're scaling up the value of x by 10 we need a larger bit register                   
    
    //register
    always_ff@(posedge clk, posedge reset)
    begin
        if(reset)
            r_reg <= 0;
        else if(en)
            r_reg <= r_next;
        else
            r_reg <= r_reg;
    end
    
    //next state
    assign r_next = (r_reg == (x * 10)) ? 1 : r_reg + 1; //after testing need to start count at 1 rather
                                                         //than 0 to ensure 100ns rather than 110 ns         
    //output
    assign fin = (r_reg == (x * 10));
endmodule                           
