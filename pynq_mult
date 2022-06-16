`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 12:06:55 AM
// Design Name: 
// Module Name: pynq_mult
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


module pynq_mult(
    input wire [1:0] switches,
    input wire [2:0] mult_inputs,
    input clk,
    input mult_clk,
    output wire [5:0] output_LEDs,   // Green color LEDs
    output wire start,              // Start LED (red)
    output wire done                // Done LED (red)
    );
    
    reg [2:0] X;
    reg [2:0] Y;
    reg [5:0] product;
    reg start_signal;
    reg output_LEDs_reg;
    
    assign start = start_signal;
    assign output_LEDs = output_LEDs_reg;
    
    // Initialize
    initial begin
        X <= 3'd0;              // Reset X and Y
        Y <= 3'd0;
        start_signal <= 1'b0;   // Reset start signal
    end
    
    wire slow_clk;
    wire [5:0] mult_output;
    
//    Input format :- push_button_input, sys_clock, debounced push_button
    debounce(clk, mult_clk, slow_clk);

//    Input format :- A, B, start, clk, done, product
    multiplier mult(X, Y, start, mult_clk, done, mult_output);
    
    always @(posedge slow_clk) begin
        // without debouncing
        case (switches)
            2'b00: begin // read X from BTN2:0 and display X in 3 leds and write it to a register
                X <= mult_inputs;
                output_LEDs_reg <= {3'b000, mult_inputs};
            end

            2'b01: begin // read Y from BTN2:0 display Y in 3 leds and write it to a register
                Y <= mult_inputs;
                output_LEDs_reg <= {3'b000, mult_inputs};
            end
            
            2'b10:  // start signal and display done in red in 2 leds
            begin
                start_signal <= 1'b1;   // send start signal
                start_signal <= #10 1'b0;
            end
            2'b11:  // display results in 6 leads
                output_LEDs_reg <= mult_output;
        endcase
    end
endmodule
