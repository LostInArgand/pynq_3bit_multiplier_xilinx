
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2022 03:32:45 PM
// Design Name: 
// Module Name: t_multiplier
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


module t_multiplier;

    reg clk;
    reg start;
    reg [2:0] multiplicand;
    reg [2:0] multiplier;
    wire done;
    wire [5:0] product;
    
    // Initial values
    initial begin
        start <= 1'b0;
    end
    
    
    // Input format:- A, B, start, clk, done, product 
    multiplier mult(multiplicand, multiplier, start, clk, done, product);
    // For .vcd file
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
    
    // stopwatch
    initial #350 $finish;
    
    // Clock
    initial begin
        clk <= 1'b0;
    end
        
    initial
        repeat(90)
            #5 clk <= ~clk;
    
    // Check multiplier
    initial begin
        // set multiplier values
        multiplicand <= 3'b111;
        multiplier <= 3'b111;
        
        #10 start = 1'b1;
        #10 start = 1'b0;
        
        #100 multiplicand = 3'b111;
            multiplier = 3'b101;
        #10 start = 1'b1;
        #10 start = 1'b0;
        
        #100 multiplicand = 3'b100;
            multiplier = 3'b001;
        #10 start = 1'b1;
        #10 start = 1'b0;
        
        #100 multiplicand = 3'b111;
            multiplier = 3'b100;
        #10 start = 1'b1;
        #10 start = 1'b0;
        
        
    end
    
    
    
endmodule

