module elevator_controller_tb;

    reg clk;
    reg reset;
    reg [1:0] request_floor;
    reg request;
    wire [1:0] current_floor;
    wire up, down, door_open;

    // Instantiate DUT
    elevator_controller uut (
        .clk(clk),
        .reset(reset),
        .request_floor(request_floor),
        .request(request),
        .current_floor(current_floor),
        .up(up),
        .down(down),
        .door_open(door_open)
    );

    // Generate clock (10 ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        request = 0;
        request_floor = 2'b00;

        // Release reset
        #20 reset = 0;

        // Test case 1: Move from 0 to 2
        #20 request_floor = 2'b10;
        request = 1;
        #10 request = 0;

        #50;

        // Test case 2: Move 2 to 1
        #20 request_floor = 2'b01;
        request = 1;
        #10 request = 0;

        #50;

        // Test case 3: Move 1 to 3
        #20 request_floor = 2'b11;
        request = 1;
        #10 request = 0;

        #50;

        // Test case 4: Move 3 to 0
        #20 request_floor = 2'b00;
        request = 1;
        #10 request = 0;

        #100;

        // End simulation
        #50;
        $stop; // ModelSim equivalent to stop sim
    end

    // Optional: text output in ModelSim console
    initial begin
        $display("Time\tFloor\tReq_Floor\tUp\tDown\tDoor");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
            $time, current_floor, request_floor, up, down, door_open);
    end

endmodule 
