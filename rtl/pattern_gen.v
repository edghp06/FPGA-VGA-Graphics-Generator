`timescale 1ns / 1ps

// Colours each pixel: white inside the 40x40 square, dark blue elsewhere,
// black during blanking.
module pattern_gen (
    input wire [9:0] pixel_x,
    input wire [9:0] pixel_y,
    input wire       active_video,

    input wire [9:0] square_x,
    input wire [9:0] square_y,

    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
);

    localparam SQUARE_SIZE = 40;

    wire inside_square;

    assign inside_square =
        (pixel_x >= square_x) &&
        (pixel_x <  square_x + SQUARE_SIZE) &&
        (pixel_y >= square_y) &&
        (pixel_y <  square_y + SQUARE_SIZE);

    always @(*) begin
        red   = 4'd0;
        green = 4'd0;
        blue  = 4'd0;

        if (active_video) begin
            if (inside_square) begin
                red   = 4'd15;
                green = 4'd15;
                blue  = 4'd15;
            end else begin
                red   = 4'd0;
                green = 4'd0;
                blue  = 4'd4;
            end
        end
    end

endmodule