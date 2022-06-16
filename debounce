`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 08:34:41 AM
// Design Name: 
// Module Name: debounce
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


module debounce(
    input pb_in,
    input sys_clock,
    output pb_out
    );
    
    slowed_clock slow1(sys_clock, slow_clk);
    
    
//    Input format :- D, clk, Q
    DFF dff1(pb_in, slow_clk, Q1);
    DFF dff2(Q1, slow_clk, Q2);
    
    assign Q2_bar = ~Q2;
    assign pb_out = Q1 & Q2_bar;
endmodule
