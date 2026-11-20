`timescale 1ns / 1ps

// 640x480 @ 60 Hz VGA timing from a 25 MHz pixel clock (800 x 525 counts).
// hsync and vsync are active-low.
module vga_timing (
    input  wire       clk_pix,
    input  wire       rst,

    output reg [9:0]  pixel_x,
    output reg [9:0]  pixel_y,
    output wire       hsync,
    output wire       vsync,
    output wire       active_video,
    output wire       frame_tick
);

    localparam H_VISIBLE = 640;
    localparam H_FRONT   = 16;
    localparam H_SYNC    = 96;
    localparam H_BACK    = 48;
    localparam H_TOTAL   = 800;

    localparam V_VISIBLE = 480;
    localparam V_FRONT   = 10;
    localparam V_SYNC    = 2;
    localparam V_BACK    = 33;
    localparam V_TOTAL   = 525;

    always @(posedge clk_pix) begin
        if (rst) begin
            pixel_x <= 10'd0;
            pixel_y <= 10'd0;
        end else begin
            if (pixel_x == H_TOTAL - 1) begin
                pixel_x <= 10'd0;

                if (pixel_y == V_TOTAL - 1)
                    pixel_y <= 10'd0;
                else
                    pixel_y <= pixel_y + 10'd1;
            end else begin
                pixel_x <= pixel_x + 10'd1;
            end
        end
    end

    assign active_video =
        (pixel_x < H_VISIBLE) &&
        (pixel_y < V_VISIBLE);

    assign hsync =
        ~((pixel_x >= H_VISIBLE + H_FRONT) &&
          (pixel_x <  H_VISIBLE + H_FRONT + H_SYNC));

    assign vsync =
        ~((pixel_y >= V_VISIBLE + V_FRONT) &&
          (pixel_y <  V_VISIBLE + V_FRONT + V_SYNC));

    assign frame_tick =
        (pixel_x == H_TOTAL - 1) &&
        (pixel_y == V_TOTAL - 1);

endmodule