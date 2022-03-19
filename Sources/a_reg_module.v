// a_reg_module is a module that hold a2 and a3 value generated from forward prop
// since forward prop generates a value for next state, 
// but back prop need value for current state
// it's needed to hold the value for 1 step
module a_reg_module (
    clk, rst, step, controller, a1, a
);

    input clk, rst;
    input [3:0] step, controller;
    input signed [15:0] a1;
    output signed [15:0] a;

    reg signed [15:0] temp;

    always @(posedge clk ) begin
        if(rst) begin
            temp <= 16'd0;
        end
        else begin
            if(step != 4'd0) begin
                if(controller == 4'd1) begin
                    temp <= a1;
                end
                else temp <= temp;
            end
            else temp <= temp;
        end
    end

    assign a = temp;
endmodule

////////////////////////////
//test bench for a_reg_module

module a_reg_module_tb ();
    reg clk, rst;
    reg [3:0] step, controller;
    reg signed [15:0] a1;
    wire signed [15:0] a;

    a_reg_module a_reg_module_tb(
        clk, rst, step, controller, a1, a
    );

    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    initial begin
        rst = 1;
        step = 4'd0;
        controller = 4'd0;
        
        #200
        rst = 0;
        step = 1;
        controller = 4'd1;
        #100
        controller = 4'd2;
        #100
        controller = 4'd3;

        #100
        step = 2;
        controller = 4'd1;
        #100
        controller = 4'd2;
        #100
        controller = 4'd3;

        #100
        step = 3;
        controller = 4'd1;
        #100
        controller = 4'd2;
        #100
        controller = 4'd3;
    end

    initial begin
        a1 = 16'b000000_1000000000;
        #600
        a1 = 16'b000010_0000000000;
    end
endmodule
