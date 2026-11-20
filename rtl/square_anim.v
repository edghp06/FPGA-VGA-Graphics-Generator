`timescale 1ns / 1ps

// Moves the square one pixel right per frame, from x = 100 to 500, then wraps.
module square_anim (
    input  wire       clk,
    input  wire       rst,
    input  wire       frame_tick,   // one-cycle pulse at the end of each frame

    output reg  [9:0] square_x,
    output reg  [9:0] square_y
);

    always @(posedge clk) begin
        if (rst) begin
            square_x <= 10'd100;
            square_y <= 10'd100;
        end else if (frame_tick) begin
            if (square_x < 10'd500)
                square_x <= square_x + 10'd1;
            else
                square_x <= 10'd100;
        end
    end

endmodule
