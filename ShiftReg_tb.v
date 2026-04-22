module shift_reg_tb;
    reg clk, reset, sin;
    reg [1:0] mode;
    reg [3:0] pin;
    wire [3:0] q;

    shift_reg uut (clk, reset, mode, sin, pin, q);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; sin = 0; mode = 0; pin = 0;
        #10 reset = 0;
        mode = 2'b11; pin = 4'b1011; #10;
        mode = 2'b01; sin = 1; #40; 
        mode = 2'b10; sin = 0; #40; 
        #20 $stop;
    end
endmodule
