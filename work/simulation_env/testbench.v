module testbench;
    reg CLK, RST, FLICK;
    wire [15:0] LED;

    initial begin
        #0 CLK <= 0;
        forever #10 CLK = !CLK;
    end

    initial begin
        #0 FLICK <= 0;
        #10
        forever begin
            FLICK <= 1; #5
            FLICK <= 0; #1500;
        end
    end

    initial begin
        #0 RST <= 0;
        #0 FLICK <= 0;

        #5 RST <= 1;

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
