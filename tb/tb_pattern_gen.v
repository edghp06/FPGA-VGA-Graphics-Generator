`timescale 1ns / 1ps

module tb_pattern_gen;

reg [9:0] pixel_x;
reg [9:0] pixel_y;
reg active_video;

wire [3:0] red;
wire [3:0] green;
wire [3:0] blue;

pattern_gen dut (
    .pixel_x(pixel_x),
    .pixel_y(pixel_y),
    .active_video(active_video),
    .red(red),
    .green(green),
    .blue(blue)
);

initial begin

    $dumpfile("sim/pattern_gen.vcd");
    $dumpvars(0,tb_pattern_gen);

    active_video = 1;

    pixel_x = 50;
    #10;

    pixel_x = 120;
    #10;

    pixel_x = 220;
    #10;

    pixel_x = 350;
    #10;

    pixel_x = 500;
    #10;

    active_video = 0;
    #10;

    $finish;
end

endmodule