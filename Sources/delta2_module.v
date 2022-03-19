//delta2 is a module that generates error of output input-hidden layer
module delta2_module (
    clk, rst, controller, step, w3i1, w3i2, w3i3, w3i4,
    delta31, delta32, delta33, delta34, dadz, delta2
);

    input clk, rst;
    input [3:0] step, controller;
    input signed [15:0] w3i1, w3i2, w3i3, w3i4;
    input signed [15:0] delta31, delta32, delta33, delta34, dadz;
    output signed [15:0] delta2;

    reg signed [47:0] temp;
    wire signed [47:0] mul1, mul2, mul3, mul4;

    assign mul1 = (w3i1 * delta31);
    assign mul2 = (w3i2 * delta32);
    assign mul3 = (w3i3 * delta33);
    assign mul4 = (w3i4 * delta34);

    always @(posedge clk ) begin
        if(rst) begin
            temp <= 48'd0;
        end
        else begin
            if(step != 4'd0) begin
                if(controller == 4'd8) begin
                    //dcda2 = (mul1 + mul2 + mul3 + mul4)
                    //delta2 = dcda2*dadz
                    temp <= (mul1 + mul2 + mul3 + mul4)* dadz;
                end
                else temp <= temp;
            end
            else temp <= temp;
        end
    end

    assign delta2 = temp[37:22];
endmodule

////////////////////////////
//test bench for delta2_module

module delta2_module_tb ();
    reg clk, rst;
    reg [3:0] step, controller;
    reg signed [15:0] w3i1, w3i2, w3i3, w3i4;
    reg signed [15:0] delta31, delta32, delta33, delta34, dadz;
    wire signed [15:0] delta2;

    delta2_module delta_tb(
        clk, rst, controller, step, w3i1, w3i2, w3i3, w3i4,
        delta31, delta32, delta33, delta34, dadz, delta2
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
        controller = 4'd5;
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
        w3i1 = 16'b000001_0000000000;
        w3i2 = 16'b000000_1000000000;
        w3i3 = 16'b000000_0100000000;
        w3i4 = 16'b000000_0010000000;
        delta31 = 16'b001000_0000000000; 
        delta32 = 16'b001000_0000000000;
        delta33 = 16'b001000_0000000000;
        delta34 = 16'b001000_0000000000;
        dadz = 16'b000000_1000000000;

        #400
        dadz = 16'b000000_0100000000;
        
        #400
        dadz = 16'b000001_0000000000;
    end

endmodule