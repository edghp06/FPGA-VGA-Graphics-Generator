`timescale 1ns / 1ps

module pattern_gen (
    input wire [9:0] pixel_x,
    input wire [9:0] pixel_y,
    input wire active_video,

    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
);

always @(*) begin

    // Default: black
    red   = 4'd0;
    green = 4'd0;
    blue  = 4'd0;

    if(active_video) begin

        if(pixel_x < 80) begin
            red = 4'd15;
        end

        else if(pixel_x < 160) begin
            green = 4'd15;
        end

        else if(pixel_x < 240) begin
            blue = 4'd15;
        end

        else if(pixel_x < 320) begin
            red   = 4'd15;
            green = 4'd15;
        end

        else if(pixel_x < 400) begin
            green = 4'd15;
            blue  = 4'd15;
        end

        else if(pixel_x < 480) begin
            red  = 4'd15;
            blue = 4'd15;
        end

        else if(pixel_x < 560) begin
            red   = 4'd15;
            green = 4'd15;
            blue  = 4'd15;
        end

    end
end

endmodule