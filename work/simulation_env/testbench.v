module testbench;
    reg CLK, RST, FLICK;
    wire [15:0] LED;

    reg [5:0] test_case;
    integer i;

    initial begin
        #0 CLK <= 0;
        forever #5 CLK = !CLK;
    end

    initial begin
        // Initialization
        test_case <= 0;
        #0 RST <= 0;
        #0 FLICK <= 0;
        #5 RST <= 1;

        // Test case 1 - normal_flow
        #5 test_case <= 1;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #560 FLICK <= 1;
        #5 FLICK <= 0;

        // Test case 2 - state_up_reset
        #800 test_case <= 2;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #300 RST <= 0;
        #5 RST <= 1;

        // Test case 3 - state_down_reset
        #300 test_case <= 3;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #370 RST <= 0;
        #5 RST <= 1;
         
        // Test case 4 - valid_flick
        #300 test_case <= 4;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #265 FLICK <= 1;
        #5 FLICK <= 0;
        #335 FLICK <= 1;
        #5 FLICK <= 0;
        #285 FLICK <= 1;
        #5 FLICK <= 0;

        // Test case 5 - invalid_flick
        #800 test_case <= 5;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        for (i = 0; i < 26; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #10 
        for (i = 0; i < 11; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #10
        for (i = 0; i < 4; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #10
        for (i = 0; i < 6; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #10
        for (i = 0; i < 4; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end

        // Test case 6 - long_flick_state_down_kickback_0
        #500 test_case <= 6;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #415 FLICK <= 1;
        #40 FLICK <= 0;
        
        // Test case 7 - long_flick_state_down_kickback_5
        #800 test_case <= 7;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #365 FLICK <= 1;
        #40 FLICK <= 0;
        
        // Test case 8 - reset_with_flick 
        #600 test_case <= 8;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #355 RST <= 0;
        #0 FLICK <= 1;
        #5 RST <= 1;
        #0 FLICK <= 0;

        // Test case 9 - reset_with_clk
        #200 test_case <= 9;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #100 RST <= 0;
        #5 RST <= 1;

        // Test case 10 - reset_with_clk_with_flick 
        #300 test_case <= 10;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #360 RST <= 0;
        #0 FLICK <= 1;
        #5 RST <= 1;
        #0 FLICK <= 0;

        // Test case 11 - flick_after_reset 
        #300 test_case <= 11;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #355 RST <= 0;
        #5 RST <= 1;
        #0 FLICK <= 1;
        #5 FLICK <= 0;


        #10000 $finish;
    end

    initial begin
        $recordfile("waves");
        $recordvars("depth=0", testbench);
    end

    bound_flasher bound_flasher(
        .CLK(CLK),
        .RST(RST),
        .FLICK(FLICK),
        .LED(LED)
    );
endmodule
