
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2022 02:21:37 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(
    input wire [2:0] A,
    input wire [2:0] B,
    input start,
    input clk,
    output reg done,
    output reg [5:0] product
    );
    
    reg [2:0] multiplier;
    reg [2:0] multiplicand;
    reg [3:0] accumulator;
    
    reg [1:0] state;
    reg [1:0] nextstate;
    
    reg [1:0] counter;
    
    initial begin
        state <= 2'b00;
        nextstate <= 2'b00;
    end
    
    
    // Use sequential design
    always @(posedge clk) state <= nextstate;     // To avoid state changes at negative edge of start signal
    
    // Always at a state change
    always @(state)
    begin
        case (state)
            2'b00: begin
                if(start) begin
                    // Load inputs onto registers and goto the next state
                    nextstate <= 2'b01;
                    multiplicand <= A;
                    multiplier <= B;
                    product <= 6'd0;
                    counter <= 2'd0;
                    accumulator <= 4'd0;
                    // Clear done bit
                    done <= 1'b0;
                end
                else nextstate <= 2'b00;
            end
 
            2'b01: begin         //multiplier steps
                
                // If lsb = 1, perform addition
                if (multiplier[0]) accumulator = accumulator + {1'b0, multiplicand};
                
                // goto next state
                nextstate = 2'b10;
            end
            2'b10: begin
                counter = counter + 1; // Blocking command for counter update
                product[5:3] = accumulator[2:0]; // Assign before shifting
                product = product >> 1;
                product[5] = accumulator[3];        // Add the carry bit
                accumulator <= accumulator >> 1;
                multiplier <= multiplier >> 1;
                // Goto next state depending on the value of the counter
                if (counter < 3) begin
                    nextstate = 2'b01;
                end
                else nextstate <= 2'b11;
            end
            2'b11: begin         //finish
                done <= 1'b1;
                nextstate <= 2'b00;
            end
        endcase
    end
    always @(posedge start) begin
        // Load inputs onto registers
        
        multiplicand = A;
        multiplier = B;
        product = 6'd0;
        counter = 2'd0;
        accumulator = 4'd0;
        // Clear done bit
        done = 1'b0;
        
        nextstate = 2'b01;     // Goto state 1
    end
endmodule
