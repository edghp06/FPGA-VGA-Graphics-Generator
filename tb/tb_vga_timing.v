`timescale 1ns / 1ps

module tb_vga_timing;

    reg clk_pix = 1'b0;
    reg rst     = 1'b1;

    wire [9:0] pixel_x;
    wire [9:0] pixel_y;
    wire hsync;
    wire vsync;
    wire active_video;
    wire frame_tick;

    vga_timing dut (
        .clk_pix(clk_pix),
        .rst(rst),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .hsync(hsync),
        .vsync(vsync),
        .active_video(active_video),
        .frame_tick(frame_tick)
    );

    always #20 clk_pix = ~clk_pix; // 25 MHz

    initial begin
        $dumpfile("sim/vga_timing.vcd");
        $dumpvars(0, tb_vga_timing);

        #100;
        rst = 1'b0;

        #(40 * 800 * 525 * 2);

        $finish;
    end

endmodule