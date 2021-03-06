module bound_flasher(CLK, RST, FLICK, LED);
    input CLK;
    input RST;
    input FLICK;
    output reg [15:0] LED;

    reg [1:0] state;
    reg [1:0] min_max_key;
    reg [15:0] max;
    reg [15:0] min;

    wire valid_flick;

    parameter IDLE = 2'b00;
    parameter UP   = 2'b01;
    parameter DOWN = 2'b10;
    parameter KB0  = 16'h0000;
    parameter KB1  = 16'h001f;
    parameter MAX_KEY = 3;

    assign valid_flick = (state == IDLE || (state == DOWN && min_max_key < 2 && (LED == KB0 || LED == KB1))) ? FLICK : 0;

    always @(min_max_key) begin
        case (min_max_key)
            0:          begin max = 16'hffff; min = 16'h001f; end
            1:          begin max = 16'h07ff; min = 16'h0000; end
            2:          begin max = 16'h003f; min = 16'h0000; end
            default:    begin max =        0; min =        0; end
        endcase
    end

    always @(posedge CLK, negedge RST, posedge valid_flick) begin
        if (!RST) begin
            state <= IDLE;
            min_max_key <= 0;
            LED <= 0;
        end
        else if (valid_flick) begin
            if (state == IDLE) state <= UP;
            else if (state == DOWN && min_max_key < 2 && (LED == KB0 || LED == KB1)) state <= UP;
        end
        else begin
            case (state)
                UP: begin
                    if (LED == max) begin
                        state <= DOWN;
                        LED <= LED >> 1;
                    end
                    else begin
                        LED <= (LED << 1) + 1;
                    end
                end

                DOWN: begin
                    if (LED == min) begin
                        if (min_max_key >= MAX_KEY-1) begin
                            state <= IDLE;
                            min_max_key <= 0;
                            LED <= 0;
                        end
                        else begin
                            state <= UP;
                            min_max_key <= min_max_key + 1;
                            LED <= (LED << 1) + 1;
                        end
                    end
                    else begin
                        LED <= LED >> 1;
                    end
                end
            endcase
        end
    end
endmodule
