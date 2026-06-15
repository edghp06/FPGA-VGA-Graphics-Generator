`timescale 1ns / 1ps

module tb_pattern_gen;

    reg [9:0] pixel_x;
    reg [9:0] pixel_y;
    reg       active_video;

    reg [9:0] square_x;
    reg [9:0] square_y;

    wire [3:0] red;
    wire [3:0] green;
    wire [3:0] blue;

    pattern_gen dut (
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .active_video(active_video),
        .square_x(square_x),
        .square_y(square_y),
        .red(red),
        .green(green),
        .blue(blue)
    );

    initial begin
        $dumpfile("sim/pattern_gen.vcd");
        $dumpvars(0, tb_pattern_gen);

        active_video = 1;
        square_x = 100;
        square_y = 100;

        pixel_x = 110; pixel_y = 110; #10; // inside square
        pixel_x = 90;  pixel_y = 110; #10; // left of square
        pixel_x = 110; pixel_y = 90;  #10; // above square
        pixel_x = 139; pixel_y = 139; #10; // inside square edge
        pixel_x = 140; pixel_y = 140; #10; // outside square

        active_video = 0;
        pixel_x = 110; pixel_y = 110; #10; // blanking

        $finish;
    end

endmodule