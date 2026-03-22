module elevator_top(
    input CLOCK_50,        // 50 MHz FPGA clock
    input [1:0] SW,        // Switches to select floor
    input [1:0] KEY,       // KEY[0]=reset, KEY[1]=request
    output [2:0] LEDR      // LEDs for Up, Down, Door
);

    // Clock divider to slow down the 50MHz clock
    reg [25:0] clk_div;
    always @(posedge CLOCK_50)
        clk_div <= clk_div + 1;
wire slow_clk = clk_div[24];  // ~1 Hz

Wire [1:0] current floor;
Wire up,down,door_open;

    // Instantiate elevator controller
    elevator_controller uut (
        .clk(slow_clk),
        .reset(~KEY[0]),         // Active-low reset
        .request_floor(SW[1:0]),
        .request(~KEY[1]),       // Active-low button
        .current_floor(current_floor),
        .up(up),
        .down(down),
        .door_open(door_open)
    );

    // Output LEDs for movement and door
    assign LEDR[0] = up;         // LED0 = Up
    assign LEDR[1] = down;       // LED1 = Down
    assign LEDR[2] = door_open;  // LED2 = Door open

endmodule
