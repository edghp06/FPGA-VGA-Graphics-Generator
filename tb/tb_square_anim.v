`timescale 1ns / 1ps

module tb_square_anim;

reg clk = 0;
reg rst = 1;
reg frame_tick = 0;

wire [9:0] square_x;
wire [9:0] square_y;

square_anim dut (
    .clk(clk),
    .rst(rst),
    .frame_tick(frame_tick),
    .square_x(square_x),
    .square_y(square_y)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("sim/square_anim.vcd");
    $dumpvars(0,tb_square_anim);

    #20;
    rst = 0;

    repeat(10) begin
        #20 frame_tick = 1;
        #10 frame_tick = 0;
    end

    #100;
    $finish;

end

endmodule