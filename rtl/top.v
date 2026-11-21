`timescale 1ns / 1ps

// Top level: VGA timing -> square position -> pixel colour.
// clk is used directly as the 25 MHz pixel clock.
module top (
    input  wire       clk,
    input  wire       rst,

    output wire       hsync,
    output wire       vsync,
    output wire [3:0] red,
    output wire [3:0] green,
    output wire [3:0] blue
);

    wire [9:0] pixel_x;
    wire [9:0] pixel_y;
    wire       active_video;
    wire       frame_tick;
    wire [9:0] square_x;
    wire [9:0] square_y;

    vga_timing timing_inst (
        .clk_pix      (clk),
        .rst          (rst),
        .pixel_x      (pixel_x),
        .pixel_y      (pixel_y),
        .hsync        (hsync),
        .vsync        (vsync),
        .active_video (active_video),
        .frame_tick   (frame_tick)
    );

    square_anim square_inst (
        .clk        (clk),
        .rst        (rst),
        .frame_tick (frame_tick),
        .square_x   (square_x),
        .square_y   (square_y)
    );

    pattern_gen pattern_inst (
        .pixel_x      (pixel_x),
        .pixel_y      (pixel_y),
        .active_video (active_video),
        .square_x     (square_x),
        .square_y     (square_y),
        .red          (red),
        .green        (green),
        .blue         (blue)
    );

endmodule
