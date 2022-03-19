//reward module is a module that generates reward from input next state
module reward_module (clk, st, st1, step, reward);
    input clk;
    input [3:0] step, st, st1;
    output [15:0] reward;

    wire [15:0] reward_temp, penalty_temp;
    parameter [15:0] minusfive_representation = -16'b000101_0000000000;
    parameter [15:0] ten_representation = 16'b001010_0000000000;

    //if state = 5, 7, or 8, reward = -5
    assign reward_temp = ((st1 == 4'd5) || (st1 == 4'd7) 
                        || (st1 == 4'd8))? minusfive_representation :
                        ((st1 == 4'd9)? ten_representation : 16'd0);
    //if st1 = st or step = 15, penalty -5
    assign penalty_temp = ((st1 == st) || 
                        (step == 4'd15))? minusfive_representation : 16'd0;
    assign reward = reward_temp + penalty_temp;
endmodule

////////////////////////////
//test bench for reward module
module reward_module_tb ();
    reg clk;
    reg [3:0] step, st, st1;
    wire [15:0] reward;

    reward_module rewardmodule(clk, st, st1, step, reward);

    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    initial begin
        step = 4'd0;
        forever #100 step = step + 1;
    end

    initial begin
        st = 4'd1;
        st1 = 4'd2;

        #100
        st = 4'd2;
        st1 = 4'd2;

        #100
        st = 4'd2;
        st1 = 4'd5;

        #100
        st = 4'd5;
        st1 = 4'd8;

        #100
        st = 4'd8;
        st1 = 4'd8;
        
        #100
        st = 4'd8;
        st1 = 4'd9;

    end
endmodule