`timescale 1ns / 1ps

module square_anim (

    input wire clk,
    input wire rst,
    input wire frame_tick,

    output reg [9:0] square_x,
    output reg [9:0] square_y

);

    always @(posedge clk) begin

        if(rst) begin
            square_x <= 100;
            square_y <= 100;
        end

        else if(frame_tick) begin

            if(square_x < 500)
                square_x <= square_x + 1;
            else
                square_x <= 100;

        end

    end

endmodule