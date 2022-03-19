//dadz is a module that generates differential of activation function
//dadz = (1-a)*a where a is sigmoid function
module dadz_module (
    clk, rst, step, controller, a, dadz
);
    input  clk, rst;
    input [3:0] step, controller;
    input signed [15:0] a;
    output signed [15:0] dadz;

    reg signed [31:0] temp;
    parameter [15:0] one_representation = 16'b000001_0000000000;

    always @(posedge clk ) begin
        if(rst) begin
            temp = 31'd0;
        end
        else begin
            if(step != 4'd0) begin
                if(controller == 4'd6) begin
                    temp <= (one_representation - a) * a;
                end
                else temp = temp;
            end
            else temp = temp;
        end
    end

    assign dadz = temp[25:10];
endmodule

////////////////////////////
//test bench for dadz_module
module dadz_module_tb ();
    reg  clk, rst;
    reg [3:0] step, controller;
    reg signed [15:0] a;
    wire signed [15:0] dadz;

    dadz_module dadz_tb(
        clk, rst, step, controller, a, dadz
    );

    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    initial begin
        rst = 1;
        step = 4'd0;
        controller = 4'd4;
        
        #200
        rst = 0;
        step = 1;
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;

        #100
        step = 2;
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
    end

    initial begin
        a = 16'b000000_1000000000;
        #600
        a = 16'b000010_0000000000;
    end
endmodule

