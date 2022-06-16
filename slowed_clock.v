`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 08:44:49 AM
// Design Name: 
// Module Name: slowed_clock
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


module slowed_clock(
    input clk,
    output reg slow_clk
    );
    
    reg [31:0] counter;
    
    initial begin
        counter <= 32'd0;
    end
    
    always @(posedge clk) begin
        // 100 MHz clock to 4Mhz
        counter <= (counter >= 249999) ? 0 : counter + 1;
        slow_clk <= (counter < 125000) ? 1'b0 : 1'b1;
    end
endmodule
