module testbench;
    reg CLK, RST, FLICK;
    wire [15:0] LED;

    reg [3:0] test_case;
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

        // Test case 1
        #5 test_case <= 1;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #525 FLICK <= 1;
        #5 FLICK <= 0;

        // Test case 2
        #800 test_case <= 2;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #300 RST <= 0;
        #5 RST <= 1;

        // Test case 3
        #300 test_case <= 3;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #370 RST <= 0;
        #5 RST <= 1;
         
        // Test case 4
        #300 test_case <= 4;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #10 FLICK <= 1;
        #5 FLICK <= 0;
        
        // Test case 5
        #800 test_case <= 5;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #510 FLICK <= 1;
        #5 FLICK <= 0;
        
        // Test case 6
        #500 test_case <= 6;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #60 FLICK <= 1;
        #5 FLICK <= 0;
        #390 FLICK <= 1;
        #5 FLICK <= 0;
        
        // Test case 7
        #300 test_case <= 7;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        #255 FLICK <= 1;
        #5 FLICK <= 0;
        
        // Test case 8
        #600 test_case <= 8;
        #0 FLICK <= 1;
        #5 FLICK <= 0;
        for (i = 0; i < 25; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #20 
        for (i = 0; i < 8; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #20
        for (i = 0; i < 3; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        #20
        for (i = 0; i < 8; i = i + 1) begin
            #5 FLICK <= 1;
            #5 FLICK <= 0;
        end
        
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
