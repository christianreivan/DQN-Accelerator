module db_module (
    clk, rst, step, controller, delta, deltab
);
    input clk, rst;
    input [3:0] step, controller;
    input signed [15:0] delta;
    output signed [15:0] deltab;
	 
    reg signed [31:0] temp;
    
	 always @(posedge clk ) begin
        if (rst) begin
            temp <= 32'd0;
        end else begin
            if(step != 4'd0) begin
                if(controller == 9) begin
                    temp <= (delta);
                end
                else temp <= temp;
            end
            else temp <= temp;
        end
    end
    //deltab = delta * 0.03125
    assign deltab = (temp[25:10]) * 16'b000000_0000100000;
endmodule