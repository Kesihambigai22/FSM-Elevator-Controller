module elevator_controller(
    input clk,
    input reset,
    input [1:0] request_floor,
    input request,
    output reg [1:0] current_floor,
    output reg up,
    output reg down,
    output reg door_open
);

    parameter IDLE = 2'b00;
    parameter MOVE = 2'b01;
    parameter DOOR = 2'b10;

    reg [1:0] state;
    reg [3:0] timer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_floor <= 2'b00;
            state <= IDLE;
            up <= 0;
            down <= 0;
            door_open <= 0;
            timer <= 0;
        end else begin
            case (state)

                IDLE: begin
                    up <= 0;
                    down <= 0;
                    door_open <= 0;
                    timer <= 0;
                    if (request) begin
                        if (request_floor > current_floor)
                            state <= MOVE;
                        else if (request_floor < current_floor)
                            state <= MOVE;
                        else
                            state <= DOOR;
                    end
                end

                MOVE: begin
                    if (current_floor < request_floor) begin
                        up <= 1;
                        down <= 0;
                        current_floor <= current_floor + 1;
                    end else if (current_floor > request_floor) begin
                        down <= 1;
                        up <= 0;
                        current_floor <= current_floor - 1;
                    end else begin
                        up <= 0;
                        down <= 0;
                        state <= DOOR;
                    end
                end

                DOOR: begin
                    door_open <= 1;
                    timer <= timer + 1;
                    if (timer >= 3'd10) begin
                        door_open <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
