// dcdw23 is a module that generates delta weight 3
module dcdw23_module (
    clk, rst, step, controller, a2, delta3, deltaw3
);
    input clk, rst;
    input [3:0] step, controller;
    input signed [15:0] a2, delta3;
    output signed [15:0] deltaw3;
    
    reg signed [31:0] temp;
    always @(posedge clk ) begin
        if (rst) begin
            temp <= 32'd0;
        end else begin
            if(step != 4'd0) begin
                if(controller == 9) begin
                    temp <= (a2*delta3);
                end
                else temp <= temp;
            end
            else temp <= temp;
        end
    end

    //deltaw3 = dcdw23 * 0.03125
    assign deltaw3 = (temp[25:10]) * 16'b000000_0000100000;
endmodule 

////////////////////////////
//test bench for dcdw23
module dcdw23_module_tb ();
    reg clk, rst;
    reg [3:0] step, controller;
    reg signed [15:0] a2, delta3;
    wire signed [15:0] deltaw3;

    dcdw23_module dcdw23_tb(
        clk, rst, step, controller, a2, delta3, deltaw3
    );
    
    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        step = 4'd0;
        controller = 4'd4;
        #100
        rst = 0;
        controller = 4'd4;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
        #100
        controller = 4'd8;
        #100
        controller = 4'd9;
        
        #100
        step = 4'd1;
        controller = 4'd4;
        #100
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
        #100
        controller = 4'd8;
        #100
        controller = 4'd9;
    end

    initial begin
        a2 = 16'b000100_0000000000;
        delta3 = 16'b000100_0000000000;

        #600
        a2 = -16'b000100_0000000000;
        delta3 = -16'b000100_0000000000;

    end
endmodule