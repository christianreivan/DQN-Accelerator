// dcdw12 is a module that generates delta weight 2
module dcdw12_module (
    clk, rst, step, controller, in_layer, delta2, deltaw2
);
    input clk, rst;
    input [3:0] step, controller;
    input signed [15:0] in_layer, delta2;
    output signed [15:0] deltaw2;

    reg signed [31:0] temp;
    always @(posedge clk ) begin
        if (rst) begin
            temp <= 32'd0;
        end else begin
            if(step != 4'd0) begin
                if(controller == 9) begin
                    temp <= (in_layer*delta2);
                end
                else temp <= temp;
            end
            else temp <= temp;
        end
    end

    //deltaw2 = dcdw12 * 0.03125
    assign deltaw2 = (temp[25:10]) * 16'b000000_0000100000;
endmodule 

////////////////////////////
//test bench for dcdw12
module dcdw12_module_tb ();
    reg clk, rst;
    reg [3:0] step, controller;
    reg signed [15:0] in_layer, delta2;
    wire signed [15:0] deltaw2;

    dcdw12_module dcdw12_tb(
        clk, rst, step, controller, in_layer, delta2, deltaw2
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
        in_layer = 16'b000100_0000000000;
        delta2 = 16'b000100_0000000000;

        #600
        in_layer = -16'b000100_0000000000;
        delta2 = -16'b000100_0000000000;

    end
endmodule