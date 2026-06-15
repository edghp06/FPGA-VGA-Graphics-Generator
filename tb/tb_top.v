`timescale 1ns / 1ps

module tb_top;

    reg clk = 0;
    reg rst = 1;

    wire hsync;
    wire vsync;
    wire [3:0] red;
    wire [3:0] green;
    wire [3:0] blue;

    top dut (
        .clk(clk),
        .rst(rst),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    always #20 clk = ~clk; // 25 MHz simulation clock

    initial begin
        $dumpfile("sim/top.vcd");
        $dumpvars(0, tb_top);

        #100;
        rst = 0;

        // Simulate a little over one frame
        #(40 * 800 * 525 + 1000);

        $finish;
    end

endmodule