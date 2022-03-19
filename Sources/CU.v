module CU (
    clk, rst, st1, episode, step, controller
);

    input clk, rst;
    input [3:0] st1;
    output [3:0] step, controller;
    output [11:0] episode;

    reg [3:0] step_temp, controller_temp;
    reg [11:0] episode_temp;

    always @(posedge clk ) begin
        if (rst) begin
            controller_temp <= 4'd0;
            step_temp <= 4'd0;
            episode_temp <= 12'd0;
        end else begin
            controller_temp <= controller_temp + 4'd1;
            if(controller_temp == 4'd9) begin
                controller_temp <= 4'd1;
                step_temp <= step_temp + 4'd1;
                if ((step_temp == 4'd15)||(st1 == 4'd9)) begin
                    step_temp <= 4'd1;
                    episode_temp <= episode_temp + 12'd1;
                end
            end
        end
    end

    assign step = step_temp;
    assign controller = controller_temp;
    assign episode = episode_temp;

endmodule


module CU_tb ();
    reg clk, rst;
    reg [3:0] st1;
    wire [3:0] step, controller;
    wire [11:0] episode;

    CU cutb(
        clk, rst, st1, episode, step, controller
    );

    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    
    initial begin
        rst = 1;
        st1 = 1;

        #200
        rst = 0;
        st1 = 1;

        #600
        st1 = 2;
        
        #900
        st1 = 3;
        
        #900
        st1 = 6;

        #900
        st1 = 9;

        #900
        st1 = 1;

        #900
        st1 = 2;
    end
endmodule