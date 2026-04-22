module shift_reg (
    input wire clk,           
    input wire reset,         
    input wire [1:0] mode,    
    input wire sin,           
    input wire [3:0] pin,    
    output reg [3:0] q        
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;
        end else begin
            case (mode)
                2'b01: q <= {sin, q[3:1]};   
                2'b10: q <= {q[2:0], sin};   
                2'b11: q <= pin;             
                default: q <= q;             
            endcase
        end
    end
endmodule
