//delta3 is a module that generates error of output hidden-output layer
module delta3_module (
    clk, rst, act, step, controller, reward, maxQt1, Qt, delta3
);
    input clk, rst;
    input [1:0] act;
    input [3:0] step, controller;
    input signed [15:0] reward, maxQt1, Qt;
    output signed [15:0] delta3;
    //gamma = 0.875

    // in this case, outFunc used is linear, which dadz = 1
    // if outFunc is not an linear func, uncomment input signal below
    // input signed [15:0] dadz;

    reg signed [31:0] temp;
    wire signed [31:0] mul1, update_temp;
    
    //mul1 = maxQt1 * gamma
    assign mul1 = (maxQt1 >>> 1) + (maxQt1 >>> 2) + (maxQt1 >>> 3);
    //update_temp = (reward + gamma*max(Qt1) - Qt(at))
    assign update_temp = mul1 + reward - Qt;

    always @(posedge clk ) begin
        if(rst) begin
            temp = 31'd0;
        end
        else begin
            if(step != 4'd0) begin
                if((controller == 4'd7) && (act == 2'd0))begin
                    temp <= update_temp;
                end
                else temp = temp;
            end
            else temp = temp;
        end
    end

    assign delta3 = temp[25:10];
endmodule

//act == 1
module delta3_module1 (
    clk, rst, act, step, controller, reward, maxQt1, Qt, delta3
);
    input clk, rst;
    input [1:0] act;
    input [3:0] step, controller;
    input signed [15:0] reward, maxQt1, Qt;
    output signed [15:0] delta3;
    //gamma = 0.875

    // in this case, outFunc used is linear, which dadz = 1
    // if outFunc is not an linear func, uncomment input signal below
    // input signed [15:0] dadz;

    reg signed [31:0] temp;
    wire signed [31:0] mul1, update_temp;
    
    //mul1 = maxQt1 * gamma
    assign mul1 = (maxQt1 >>> 1) + (maxQt1 >>> 2) + (maxQt1 >>> 3);
    //update_temp = (reward + gamma*max(Qt1) - Qt(at))
    assign update_temp = mul1 + reward - Qt;

    always @(posedge clk ) begin
        if(rst) begin
            temp = 31'd0;
        end
        else begin
            if(step != 4'd0) begin
                if((controller == 4'd7) && (act == 2'd1))begin
                    temp <= update_temp;
                end
                else temp = temp;
            end
            else temp = temp;
        end
    end

    assign delta3 = temp[25:10];
endmodule

//act == 2
module delta3_module2 (
    clk, rst, act, step, controller, reward, maxQt1, Qt, delta3
);
    input clk, rst;
    input [1:0] act;
    input [3:0] step, controller;
    input signed [15:0] reward, maxQt1, Qt;
    output signed [15:0] delta3;
    //gamma = 0.875

    // in this case, outFunc used is linear, which dadz = 1
    // if outFunc is not an linear func, uncomment input signal below
    // input signed [15:0] dadz;

    reg signed [31:0] temp;
    wire signed [31:0] mul1, update_temp;
    
    //mul1 = maxQt1 * gamma
    assign mul1 = (maxQt1 >>> 1) + (maxQt1 >>> 2) + (maxQt1 >>> 3);
    //update_temp = (reward + gamma*max(Qt1) - Qt(at))
    assign update_temp = mul1 + reward - Qt;

    always @(posedge clk ) begin
        if(rst) begin
            temp = 31'd0;
        end
        else begin
            if(step != 4'd0) begin
                if((controller == 4'd7) && (act == 2'd2))begin
                    temp <= update_temp;
                end
                else temp = temp;
            end
            else temp = temp;
        end
    end

    assign delta3 = temp[25:10];
endmodule

//act == 3
module delta3_module3 (
    clk, rst, act, step, controller, reward, maxQt1, Qt, delta3
);
    input clk, rst;
    input [1:0] act;
    input [3:0] step, controller;
    input signed [15:0] reward, maxQt1, Qt;
    output signed [15:0] delta3;
    //gamma = 0.875

    // in this case, outFunc used is linear, which dadz = 1
    // if outFunc is not an linear func, uncomment input signal below
    // input signed [15:0] dadz;

    reg signed [31:0] temp;
    wire signed [31:0] mul1, update_temp;
    
    //mul1 = maxQt1 * gamma
    assign mul1 = (maxQt1 >>> 1) + (maxQt1 >>> 2) + (maxQt1 >>> 3);
    //update_temp = (reward + gamma*max(Qt1) - Qt(at))
    assign update_temp = mul1 + reward - Qt;

    always @(posedge clk ) begin
        if(rst) begin
            temp = 31'd0;
        end
        else begin
            if(step != 4'd0) begin
                if((controller == 4'd7) && (act == 2'd3))begin
                    temp <= update_temp;
                end
                else temp = temp;
            end
            else temp = temp;
        end
    end

    assign delta3 = temp[25:10];
endmodule

////////////////////////////
//test bench for delta3_module
module delta3_module_tb ();
    reg clk, rst;
    reg [1:0] act;
    reg [3:0] step, controller;
    reg signed [15:0] reward, maxQt1, Qt;
    wire signed [15:0] delta3;

    delta3_module delta3_tb(
        clk, rst, act, step, controller, reward, maxQt1, Qt, delta3
    );
    
    initial begin 
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    initial begin
        rst = 1;
        step = 0;
        controller = 4'd0;

        #200
        rst = 0;
        step = 1;
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
        #100
        controller = 4'd8;
        
        #100
        step = 2;
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
        #100
        controller = 4'd8;
        
        #100
        step = 3;
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
        #100
        controller = 4'd8;

        #100
        step = 4;
        controller = 4'd5;
        #100
        controller = 4'd6;
        #100
        controller = 4'd7;
        #100
        controller = 4'd8;
    end

    initial begin
        reward = 16'b000101_0000000000;
        maxQt1 = 16'b000101_0000000000; 
        Qt = 16'b000001_0000000000;
        act = 2'd0;

        #600
        reward = 16'b001010_0000000000;
        maxQt1 = 16'b000011_0000000000; 
        Qt = 16'b000010_1000000000;
        act = 2'd1;

        #400
        act = 2'd0;

        #400
        reward = 16'b000101_0000000000;
        maxQt1 = 16'b000101_0000000000; 
        Qt = 16'b000001_0000000000;
    end
endmodule