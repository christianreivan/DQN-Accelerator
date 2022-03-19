module top_level (
    clk, rst
);
    input clk, rst;
    wire [1:0] act;
    wire [3:0] step, controller, st, st1;
    wire [11:0] episode;
    wire signed [15:0] Qt, maxQt1;
    wire signed [15:0] deltaw2_0_0, deltaw2_1_0, deltaw2_2_0, deltaw2_3_0, deltaw2_4_0,
                        deltaw2_0_1, deltaw2_1_1, deltaw2_2_1, deltaw2_3_1, deltaw2_4_1,
                        deltaw2_0_2, deltaw2_1_2, deltaw2_2_2, deltaw2_3_2, deltaw2_4_2,
                        deltaw2_0_3, deltaw2_1_3, deltaw2_2_3, deltaw2_3_3, deltaw2_4_3,
                        deltaw2_0_4, deltaw2_1_4, deltaw2_2_4, deltaw2_3_4, deltaw2_4_4,
                        deltaw2_0_5, deltaw2_1_5, deltaw2_2_5, deltaw2_3_5, deltaw2_4_5,
                        deltaw2_0_6, deltaw2_1_6, deltaw2_2_6, deltaw2_3_6, deltaw2_4_6,
                        deltaw2_0_7, deltaw2_1_7, deltaw2_2_7, deltaw2_3_7, deltaw2_4_7,
                        deltaw2_0_8, deltaw2_1_8, deltaw2_2_8, deltaw2_3_8, deltaw2_4_8;
    wire signed [15:0] deltab2_0, deltab2_1, deltab2_2, deltab2_3, deltab2_4;
    wire signed [15:0] deltaw3_0_0, deltaw3_1_0, deltaw3_2_0, deltaw3_3_0,
                        deltaw3_0_1, deltaw3_1_1, deltaw3_2_1, deltaw3_3_1,
                        deltaw3_0_2, deltaw3_1_2, deltaw3_2_2, deltaw3_3_2,
                        deltaw3_0_3, deltaw3_1_3, deltaw3_2_3, deltaw3_3_3,
                        deltaw3_0_4, deltaw3_1_4, deltaw3_2_4, deltaw3_3_4;
    wire signed [15:0] deltab3_0, deltab3_1, deltab3_2, deltab3_3;
    wire signed [15:0] a2_1out, a2_2out, a2_3out, a2_4out, a2_5out;
    wire signed [15:0] w3_0_0, w3_1_0, w3_2_0, w3_3_0,
                        w3_0_1, w3_1_1, w3_2_1, w3_3_1,
                        w3_0_2, w3_1_2, w3_2_2, w3_3_2,
                        w3_0_3, w3_1_3, w3_2_3, w3_3_3,
                        w3_0_4, w3_1_4, w3_2_4, w3_3_4;
    wire signed [15:0] a3_1out, a3_2out, a3_3out, a3_4out;
    wire signed [15:0] a2st_1, a2st_2, a2st_3, a2st_4, a2st_5;
    wire signed [15:0] a3st_1, a3st_2, a3st_3, a3st_4;


    CU CU_mod(
        clk, rst, st1, episode, step, controller
    );

fwd_prop forward_porp(
    clk, rst,
    //input deltaw2
    deltaw2_0_0, deltaw2_1_0, deltaw2_2_0, deltaw2_3_0, deltaw2_4_0,
    deltaw2_0_1, deltaw2_1_1, deltaw2_2_1, deltaw2_3_1, deltaw2_4_1,
    deltaw2_0_2, deltaw2_1_2, deltaw2_2_2, deltaw2_3_2, deltaw2_4_2,
    deltaw2_0_3, deltaw2_1_3, deltaw2_2_3, deltaw2_3_3, deltaw2_4_3,
    deltaw2_0_4, deltaw2_1_4, deltaw2_2_4, deltaw2_3_4, deltaw2_4_4,
    deltaw2_0_5, deltaw2_1_5, deltaw2_2_5, deltaw2_3_5, deltaw2_4_5,
    deltaw2_0_6, deltaw2_1_6, deltaw2_2_6, deltaw2_3_6, deltaw2_4_6,
    deltaw2_0_7, deltaw2_1_7, deltaw2_2_7, deltaw2_3_7, deltaw2_4_7,
    deltaw2_0_8, deltaw2_1_8, deltaw2_2_8, deltaw2_3_8, deltaw2_4_8,

    //input deltab2
    deltab2_0, deltab2_1, deltab2_2, deltab2_3, deltab2_4,

    //input deltaw3
    deltaw3_0_0, deltaw3_1_0, deltaw3_2_0, deltaw3_3_0,
    deltaw3_0_1, deltaw3_1_1, deltaw3_2_1, deltaw3_3_1,
    deltaw3_0_2, deltaw3_1_2, deltaw3_2_2, deltaw3_3_2,
    deltaw3_0_3, deltaw3_1_3, deltaw3_2_3, deltaw3_3_3,
    deltaw3_0_4, deltaw3_1_4, deltaw3_2_4, deltaw3_3_4,

    //input deltab3
    deltab3_0, deltab3_1, deltab3_2, deltab3_3,

    //control
    controller, step, st,

    //output a2st1
    a2_1out, a2_2out, a2_3out, a2_4out, a2_5out,

    //output w3
    w3_0_0, w3_1_0, w3_2_0, w3_3_0,
    w3_0_1, w3_1_1, w3_2_1, w3_3_1,
    w3_0_2, w3_1_2, w3_2_2, w3_3_2,
    w3_0_3, w3_1_3, w3_2_3, w3_3_3,
    w3_0_4, w3_1_4, w3_2_4, w3_3_4,

    //output a3st1
    a3_1out, a3_2out, a3_3out, a3_4out,

    //output a2st
    a2st_1, a2st_2, a2st_3, a2st_4, a2st_5,

    //output a3st
    a3st_1, a3st_2, a3st_3, a3st_4
);

Action_determiner action_determiner_mod(
    clk, rst, step, controller, episode,
    a3st_1, a3st_2, a3st_3, a3st_4,
    a3_1out, a3_2out, a3_3out, a3_4out, act, st, st1, Qt, maxQt1
);

Backward backprop(
//input    
    clk, rst, 
    
    //control
    step, controller, st, st1,

    //action
    act,

    //a3
    a3st_1, a3st_2, a3st_3, a3st_4,

    //a2
    a2st_1, a2st_2, a2st_3, a2st_4, a2st_5,
    
    //weight hidden-output layer
    w3_0_0, w3_0_1, w3_0_2, w3_0_3, w3_0_4, 
    w3_1_0, w3_1_1, w3_1_2, w3_1_3, w3_1_4, 
    w3_2_0, w3_2_1, w3_2_2, w3_2_3, w3_2_4,
    w3_3_0, w3_3_1, w3_3_2, w3_3_3, w3_3_4,

    //maxQt1
    Qt, maxQt1,

//output
    //delta w3
    deltaw3_0_0, deltaw3_0_1, deltaw3_0_2, deltaw3_0_3, deltaw3_0_4,
    deltaw3_1_0, deltaw3_1_1, deltaw3_1_2, deltaw3_1_3, deltaw3_1_4,
    deltaw3_2_0, deltaw3_2_1, deltaw3_2_2, deltaw3_2_3, deltaw3_2_4,
    deltaw3_3_0, deltaw3_3_1, deltaw3_3_2, deltaw3_3_3, deltaw3_3_4,

    //delta w2
    deltaw2_0_0, deltaw2_0_1, deltaw2_0_2, deltaw2_0_3, deltaw2_0_4, 
    deltaw2_0_5, deltaw2_0_6, deltaw2_0_7, deltaw2_0_8,
    deltaw2_1_0, deltaw2_1_1, deltaw2_1_2, deltaw2_1_3, deltaw2_1_4, 
    deltaw2_1_5, deltaw2_1_6, deltaw2_1_7, deltaw2_1_8,
    deltaw2_2_0, deltaw2_2_1, deltaw2_2_2, deltaw2_2_3, deltaw2_2_4, 
    deltaw2_2_5, deltaw2_2_6, deltaw2_2_7, deltaw2_2_8,
    deltaw2_3_0, deltaw2_3_1, deltaw2_3_2, deltaw2_3_3, deltaw2_3_4, 
    deltaw2_3_5, deltaw2_3_6, deltaw2_3_7, deltaw2_3_8,
    deltaw2_4_0, deltaw2_4_1, deltaw2_4_2, deltaw2_4_3, deltaw2_4_4, 
    deltaw2_4_5, deltaw2_4_6, deltaw2_4_7, deltaw2_4_8,

    //delta b3
    deltab3_0, deltab3_1, deltab3_2, deltab3_3,

    //delta b2
    deltab2_0, deltab2_1, deltab2_2, deltab2_3, deltab2_4
);
    
endmodule

/////////////////////////////////////////////
module top_level_tb ();
    reg clk, rst;

    top_level topleveltb(
        clk, rst
    );

    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    initial begin
        rst = 1;
        #200
        rst = 0;
    end
endmodule //top_level