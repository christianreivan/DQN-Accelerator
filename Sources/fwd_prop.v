module fwd_prop(

 input clk, rst,
 input signed [15:0] deltaw2_11, deltaw2_12, deltaw2_13, deltaw2_14,
deltaw2_15,
 input signed [15:0] deltaw2_21, deltaw2_22, deltaw2_23, deltaw2_24,
deltaw2_25,
 input signed [15:0] deltaw2_31, deltaw2_32, deltaw2_33, deltaw2_34,
deltaw2_35,
 input signed [15:0] deltaw2_41, deltaw2_42, deltaw2_43, deltaw2_44,
deltaw2_45,
 input signed [15:0] deltaw2_51, deltaw2_52, deltaw2_53, deltaw2_54,
deltaw2_55,
 input signed [15:0] deltaw2_61, deltaw2_62, deltaw2_63, deltaw2_64,
deltaw2_65,
 input signed [15:0] deltaw2_71, deltaw2_72, deltaw2_73, deltaw2_74,
deltaw2_75,
 input signed [15:0] deltaw2_81, deltaw2_82, deltaw2_83, deltaw2_84,
deltaw2_85,
 input signed [15:0] deltaw2_91, deltaw2_92, deltaw2_93, deltaw2_94,
deltaw2_95,
 input signed [15:0] deltab2_1, deltab2_2, deltab2_3, deltab2_4, deltab2_5,
 input signed [15:0] deltaw3_11, deltaw3_12, deltaw3_13, deltaw3_14,
 input signed [15:0] deltaw3_21, deltaw3_22, deltaw3_23, deltaw3_24,
 input signed [15:0] deltaw3_31, deltaw3_32, deltaw3_33, deltaw3_34,
 input signed [15:0] deltaw3_41, deltaw3_42, deltaw3_43, deltaw3_44,
 input signed [15:0] deltaw3_51, deltaw3_52, deltaw3_53, deltaw3_54,
 input signed [15:0] deltab3_1, deltab3_2, deltab3_3, deltab3_4,
 
 input [3:0] ctrl, step, st,
 
 output signed [15:0] a2_1out, a2_2out, a2_3out, a2_4out, a2_5out,
 output signed [15:0] w3_11out, w3_12out, w3_13out, w3_14out,
                      w3_21out, w3_22out, w3_23out, w3_24out,
                      w3_31out, w3_32out, w3_33out, w3_34out,
                      w3_41out, w3_42out, w3_43out, w3_44out,
                      w3_51out, w3_52out, w3_53out, w3_54out,
 output signed [15:0] a3_1out, a3_2out, a3_3out, a3_4out,
 output signed [15:0] a2st_1, a2st_2, a2st_3, a2st_4, a2st_5,
 output signed [15:0] a3st_1, a3st_2, a3st_3, a3st_4
 
 );
 
 wire signed [15:0] w2_1, w2_2, w2_3, w2_4, w2_5;
 wire signed [15:0] w3_11, w3_12, w3_13, w3_14, 
                    w3_21, w3_22, w3_23, w3_24,
                    w3_31, w3_32, w3_33, w3_34, 
                    w3_41, w3_42, w3_43, w3_44, 
                    w3_51, w3_52, w3_53, w3_54;
 wire signed [15:0] bias2_1, bias2_2, bias2_3, bias2_4, bias2_5;
 wire signed [15:0] sumA_1, sumA_2, sumA_3, sumA_4, sumA_5;
 wire signed [15:0] a2_1, a2_2, a2_3, a2_4, a2_5;
 wire signed [15:0] a3_1, a3_2, a3_3, a3_4;
 wire signed [15:0] bias3_1, bias3_2, bias3_3, bias3_4;
 wire signed [31:0] mult_1, mult_2, mult_3, mult_4;
 wire signed [15:0] sumB_1, sumB_2, sumB_3, sumB_4;

 reg signed [15:0] zout2_1, zout2_2, zout2_3, zout2_4, zout2_5;
 reg signed [15:0] zout3_1, zout3_2, zout3_3, zout3_4;
//Weight2 Block
weight2 read_weight_2 (.clk(clk), .st(st), .ctrl(ctrl), .step(step), .w2_1(w2_1), .w2_2(w2_2), .w2_3(w2_3), .w2_4(w2_4), .w2_5(w2_5),
 .deltaw2_11(deltaw2_11), .deltaw2_12(deltaw2_12), .deltaw2_13(deltaw2_13
), .deltaw2_14(deltaw2_14), .deltaw2_15(deltaw2_15),
 .deltaw2_21(deltaw2_21), .deltaw2_22(deltaw2_22), .deltaw2_23(deltaw2_23
), .deltaw2_24(deltaw2_24), .deltaw2_25(deltaw2_25),
 .deltaw2_31(deltaw2_31), .deltaw2_32(deltaw2_32), .deltaw2_33(deltaw2_33
), .deltaw2_34(deltaw2_34), .deltaw2_35(deltaw2_35),
 .deltaw2_41(deltaw2_41), .deltaw2_42(deltaw2_42), .deltaw2_43(deltaw2_43
), .deltaw2_44(deltaw2_44), .deltaw2_45(deltaw2_45),
 .deltaw2_51(deltaw2_51), .deltaw2_52(deltaw2_52), .deltaw2_53(deltaw2_53
), .deltaw2_54(deltaw2_54), .deltaw2_55(deltaw2_55),
 .deltaw2_61(deltaw2_61), .deltaw2_62(deltaw2_62), .deltaw2_63(deltaw2_63
), .deltaw2_64(deltaw2_64), .deltaw2_65(deltaw2_65),
 .deltaw2_71(deltaw2_71), .deltaw2_72(deltaw2_72), .deltaw2_73(deltaw2_73
), .deltaw2_74(deltaw2_74), .deltaw2_75(deltaw2_75),
 .deltaw2_81(deltaw2_81), .deltaw2_82(deltaw2_82), .deltaw2_83(deltaw2_83
), .deltaw2_84(deltaw2_84), .deltaw2_85(deltaw2_85),
 .deltaw2_91(deltaw2_91), .deltaw2_92(deltaw2_92), .deltaw2_93(deltaw2_93
), .deltaw2_94(deltaw2_94), .deltaw2_95(deltaw2_95));

//BIAS2 Block
bias2 BIAS2 (.clk(clk), .ctrl(ctrl), .step(step), .bias2_1(bias2_1), .bias2_2(bias2_2), .bias2_3(bias2_3), .bias2_4(bias2_4), .bias2_5(bias2_5), .deltab2_1(deltab2_1), .deltab2_2(deltab2_2), .deltab2_3(deltab2_3), .deltab2_4(deltab2_4), .deltab2_5(deltab2_5));

//Neural from Input to Hidden Layer
assign sumA_1 = (w2_1 + bias2_1);
assign sumA_2 = (w2_2 + bias2_2);
assign sumA_3 = (w2_3 + bias2_3);
assign sumA_4 = (w2_4 + bias2_4);
assign sumA_5 = (w2_5 + bias2_5);

always @(posedge clk)
 begin
   if (rst == 1'b1)
    begin
      zout2_1 <= 16'b000000_0000000000;
      zout2_2 <= 16'b000000_0000000000;
      zout2_3 <= 16'b000000_0000000000;
      zout2_4 <= 16'b000000_0000000000;
      zout2_5 <= 16'b000000_0000000000;
    end

   else
    begin
     if (step != 4'b0000)
      begin
        if (ctrl == 4'b0010)
         begin
          zout2_1 <= zout2_1 + sumA_1;
          zout2_2 <= zout2_2 + sumA_2;
          zout2_3 <= zout2_3 + sumA_3;
          zout2_4 <= zout2_4 + sumA_4;
          zout2_5 <= zout2_5 + sumA_5;
         end
        
        else
         begin
          zout2_1 <= zout2_1;
          zout2_2 <= zout2_2;
          zout2_3 <= zout2_3;
          zout2_4 <= zout2_4;
          zout2_5 <= zout2_5;
         end
      end
     else
      begin
          zout2_1 <= zout2_1;
          zout2_2 <= zout2_2;
          zout2_3 <= zout2_3;
          zout2_4 <= zout2_4;
          zout2_5 <= zout2_5;
      end
    end
 end
/**
NN hn1 (.clk(clk), .ctrl(ctrl), .in(in), .w(w2_1), .rst(rst), .bias(bias2_1), .zout(zout2_1));
NN hn2 (.clk(clk), .ctrl(ctrl), .in(in), .w(w2_2), .rst(rst), .bias(bias2_2), .zout(zout2_2));
NN hn3 (.clk(clk), .ctrl(ctrl), .in(in), .w(w2_3), .rst(rst), .bias(bias2_3), .zout(zout2_3));
NN hn4 (.clk(clk), .ctrl(ctrl), .in(in), .w(w2_4), .rst(rst), .bias(bias2_4), .zout(zout2_4));
NN hn5 (.clk(clk), .ctrl(ctrl), .in(in), .w(w2_5), .rst(rst), .bias(bias2_5), .zout(zout2_5));
**/

//Activation Function in Hidden Layers
activationFunction acf1 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout2_1), .dout(a2_1));
activationFunction acf2 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout2_2), .dout(a2_2));
activationFunction acf3 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout2_3), .dout(a2_3));
activationFunction acf4 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout2_4), .dout(a2_4));
activationFunction acf5 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout2_5), .dout(a2_5));

//Registering a2
a_reg_module a2st_1_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a2_1), .a(a2st_1));
a_reg_module a2st_2_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a2_2), .a(a2st_2));
a_reg_module a2st_3_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a2_3), .a(a2st_3));
a_reg_module a2st_4_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a2_4), .a(a2st_4));
a_reg_module a2st_5_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a2_5), .a(a2st_5));

//Weight 3 Block
weight3 read_weight_3
(.step(step), .clk(clk), .ctrl(ctrl), .w3_11(w3_11), .w3_12(w3_12), .w3_13(w3_13), .w3_14(w3_14),
 .w3_21(w3_21), .w3_22(w3_22), .w3_23(w3_23), .w3_24(w3_24), .w3_31(w3_31), .w3_32(w3_32), .w3_33(w3_33),
 .w3_34(w3_34), .w3_41(w3_41), .w3_42(w3_42), .w3_43(w3_43), .w3_44(w3_44), .w3_51(w3_51), .w3_52(w3_52),
 .w3_53(w3_53), .w3_54(w3_54),
 .deltaw3_11(deltaw3_11), .deltaw3_12(deltaw3_12), .deltaw3_13(deltaw3_13), .deltaw3_14(deltaw3_14),
 .deltaw3_21(deltaw3_21), .deltaw3_22(deltaw3_22), .deltaw3_23(deltaw3_23), .deltaw3_24(deltaw3_24),
 .deltaw3_31(deltaw3_31), .deltaw3_32(deltaw3_32), .deltaw3_33(deltaw3_33), .deltaw3_34(deltaw3_34),
 .deltaw3_41(deltaw3_41), .deltaw3_42(deltaw3_42), .deltaw3_43(deltaw3_43), .deltaw3_44(deltaw3_44),
 .deltaw3_51(deltaw3_51), .deltaw3_52(deltaw3_52), .deltaw3_53(deltaw3_53), .deltaw3_54(deltaw3_54));


//BIAS3 Block
bias3 BIAS3 (.clk(clk), .ctrl(ctrl), .step(step), .bias3_1(bias3_1), .bias3_2(bias3_2), .bias3_3(bias3_3), .bias3_4(bias3_4), .deltab3_1(deltab3_1), .deltab3_2(deltab3_2), .deltab3_3(deltab3_3), .deltab3_4(deltab3_4));

/**
//PS Block
p2s_a p2s1 (.clk(clk), .rst(rst), .ctrl(ctrl), .sel(sel), .a2_1(a2_1), .a2_2(a2_2), .a2_3(a2_3), .a2_4(a2_4), .a2_5(a2_5), .a(a));
**/

//Neural from Hidden Layers to Output Layers
assign mult_1 = (w3_11 * a2_1) + (w3_21 * a2_2) + (w3_31 * a2_3) + (w3_41 * a2_4) + (w3_51 * a2_5);
assign mult_2 = (w3_12 * a2_1) + (w3_22 * a2_2) + (w3_32 * a2_3) + (w3_42 * a2_4) + (w3_52 * a2_5);
assign mult_3 = (w3_13 * a2_1) + (w3_23 * a2_2) + (w3_33 * a2_3) + (w3_43 * a2_4) + (w3_53 * a2_5);
assign mult_4 = (w3_14 * a2_1) + (w3_24 * a2_2) + (w3_34 * a2_3) + (w3_44 * a2_4) + (w3_54 * a2_5);

assign sumB_1 = mult_1[25:10] + bias3_1;
assign sumB_2 = mult_2[25:10] + bias3_2;
assign sumB_3 = mult_3[25:10] + bias3_3;
assign sumB_4 = mult_4[25:10] + bias3_4;

always @(posedge clk)
 begin
   if (rst == 1'b1)
    begin
	      zout3_1 <= 16'b000000_0000000000;
          zout3_2 <= 16'b000000_0000000000;
          zout3_3 <= 16'b000000_0000000000;
          zout3_4 <= 16'b000000_0000000000;
    end

   else
    begin
     if (step != 4'b0000)
      begin
        if (ctrl == 4'b0100)
         begin
          zout3_1 <= zout3_1  + sumB_1;
          zout3_2 <= zout3_2  + sumB_2;
          zout3_3 <= zout3_3  + sumB_3;
          zout3_4 <= zout3_4  + sumB_4;
         end
        
        else
         begin
          zout3_1 <= zout3_1;
          zout3_2 <= zout3_2;
          zout3_3 <= zout3_3;
          zout3_4 <= zout3_4;
         end
      end
     else
      begin
          zout3_1 <= zout3_1;
          zout3_2 <= zout3_2;
          zout3_3 <= zout3_3;
          zout3_4 <= zout3_4;
      end
    end
 end
/**
NN hno1 (.clk(clk), .ctrl(ctrl), .in(a), .w(w3_1), .rst(rst), .bias(bias3_1), .zout(zout3_1));
NN hno2 (.clk(clk), .ctrl(ctrl), .in(a), .w(w3_2), .rst(rst), .bias(bias3_2), .zout(zout3_2));
NN hno3 (.clk(clk), .ctrl(ctrl), .in(a), .w(w3_3), .rst(rst), .bias(bias3_3), .zout(zout3_3));
NN hno4 (.clk(clk), .ctrl(ctrl), .in(a), .w(w3_4), .rst(rst), .bias(bias3_4), .zout(zout3_4));
**/

//Activation Function in Output Layers
activationFunctionB acf_out_1 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout3_1), .dout(a3_1));
activationFunctionB acf_out_2 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout3_2), .dout(a3_2));
activationFunctionB acf_out_3 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout3_3), .dout(a3_3));
activationFunctionB acf_out_4 (.clk(clk), .rst(rst), .ctrl(ctrl), .z(zout3_4), .dout(a3_4));

//Registering a3
a_reg_module a3st_1_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a3_1), .a(a3st_1));
a_reg_module a3st_2_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a3_2), .a(a3st_2));
a_reg_module a3st_3_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a3_3), .a(a3st_3));
a_reg_module a3st_4_mod (.clk(clk), .rst(rst), .step(step), .controller(ctrl), .a1(a3_4), .a(a3st_4));

//Assign output signals
assign a2_1out = a2_1;
assign a2_2out = a2_2;
assign a2_3out = a2_3;
assign a2_4out = a2_4;
assign a2_5out = a2_5;

assign a3_1out = a3_1;
assign a3_2out = a3_2;
assign a3_3out = a3_3;
assign a3_4out = a3_4;

assign w3_11out = w3_11;
assign w3_12out = w3_12;
assign w3_13out = w3_13;
assign w3_14out = w3_14;
assign w3_21out = w3_21;
assign w3_22out = w3_22;
assign w3_23out = w3_23;
assign w3_24out = w3_24;
assign w3_31out = w3_31;
assign w3_32out = w3_32;
assign w3_33out = w3_33;
assign w3_34out = w3_34;
assign w3_41out = w3_41;
assign w3_42out = w3_42;
assign w3_43out = w3_43;
assign w3_44out = w3_44;
assign w3_51out = w3_51;
assign w3_52out = w3_52;
assign w3_53out = w3_53;
assign w3_54out = w3_54;


endmodule


module fwd_tb();
 reg clk, rst;
 reg signed [15:0] deltaw2_11, deltaw2_12, deltaw2_13, deltaw2_14,
deltaw2_15;
 reg signed [15:0] deltaw2_21, deltaw2_22, deltaw2_23, deltaw2_24,
deltaw2_25;
 reg signed [15:0] deltaw2_31, deltaw2_32, deltaw2_33, deltaw2_34,
deltaw2_35;
 reg signed [15:0] deltaw2_41, deltaw2_42, deltaw2_43, deltaw2_44,
deltaw2_45;
 reg signed [15:0] deltaw2_51, deltaw2_52, deltaw2_53, deltaw2_54,
deltaw2_55;
 reg signed [15:0] deltaw2_61, deltaw2_62, deltaw2_63, deltaw2_64,
deltaw2_65;
 reg signed [15:0] deltaw2_71, deltaw2_72, deltaw2_73, deltaw2_74,
deltaw2_75;
 reg signed [15:0] deltaw2_81, deltaw2_82, deltaw2_83, deltaw2_84,
deltaw2_85;
 reg signed [15:0] deltaw2_91, deltaw2_92, deltaw2_93, deltaw2_94,
deltaw2_95;
 reg signed [15:0] deltab2_1, deltab2_2, deltab2_3, deltab2_4, deltab2_5;
 reg signed [15:0] deltaw3_11, deltaw3_12, deltaw3_13, deltaw3_14;
 reg signed [15:0] deltaw3_21, deltaw3_22, deltaw3_23, deltaw3_24;
 reg signed [15:0] deltaw3_31, deltaw3_32, deltaw3_33, deltaw3_34;
 reg signed [15:0] deltaw3_41, deltaw3_42, deltaw3_43, deltaw3_44;
 reg signed [15:0] deltaw3_51, deltaw3_52, deltaw3_53, deltaw3_54;
 reg signed [15:0] deltab3_1, deltab3_2, deltab3_3, deltab3_4;
 
 reg [3:0] controller, step, st;
 
 wire signed [15:0] a2_1out, a2_2out, a2_3out, a2_4out, a2_5out;
 wire signed [15:0] w3_11out, w3_12out, w3_13out, w3_14out,
                      w3_21out, w3_22out, w3_23out, w3_24out,
                      w3_31out, w3_32out, w3_33out, w3_34out,
                      w3_41out, w3_42out, w3_43out, w3_44out,
                      w3_51out, w3_52out, w3_53out, w3_54out;
 wire signed [15:0] a3_1out, a3_2out, a3_3out, a3_4out;
 wire signed [15:0] a2st_1, a2st_2, a2st_3, a2st_4, a2st_5;
 wire signed [15:0] a3st_1, a3st_2, a3st_3, a3st_4;

 fwd_prop forward_tb(
	clk, rst, deltaw2_11, deltaw2_12, deltaw2_13, deltaw2_14, deltaw2_15,
	deltaw2_21, deltaw2_22, deltaw2_23, deltaw2_24, deltaw2_25,
	deltaw2_31, deltaw2_32, deltaw2_33, deltaw2_34, deltaw2_35,
	deltaw2_41, deltaw2_42, deltaw2_43, deltaw2_44, deltaw2_45,
	deltaw2_51, deltaw2_52, deltaw2_53, deltaw2_54, deltaw2_55,
	deltaw2_61, deltaw2_62, deltaw2_63, deltaw2_64, deltaw2_65,
	deltaw2_71, deltaw2_72, deltaw2_73, deltaw2_74, deltaw2_75,
	deltaw2_81, deltaw2_82, deltaw2_83, deltaw2_84, deltaw2_85,
	deltaw2_91, deltaw2_92, deltaw2_93, deltaw2_94, deltaw2_95,
	deltab2_1, deltab2_2, deltab2_3, deltab2_4, deltab2_5,
	deltaw3_11, deltaw3_12, deltaw3_13, deltaw3_14,
	deltaw3_21, deltaw3_22, deltaw3_23, deltaw3_24,
	deltaw3_31, deltaw3_32, deltaw3_33, deltaw3_34,
	deltaw3_41, deltaw3_42, deltaw3_43, deltaw3_44,
	deltaw3_51, deltaw3_52, deltaw3_53, deltaw3_54,
	deltab3_1, deltab3_2, deltab3_3, deltab3_4,
	controller, step, st,
	a2_1out, a2_2out, a2_3out, a2_4out, a2_5out,
	w3_11out, w3_12out, w3_13out, w3_14out,
	w3_21out, w3_22out, w3_23out, w3_24out,
	w3_31out, w3_32out, w3_33out, w3_34out,
	w3_41out, w3_42out, w3_43out, w3_44out,
	w3_51out, w3_52out, w3_53out, w3_54out,
	a3_1out, a3_2out, a3_3out, a3_4out,
	a2st_1, a2st_2, a2st_3, a2st_4, a2st_5,
	a3st_1, a3st_2, a3st_3, a3st_4
	);
	
	initial begin
	 clk = 1'b1;
	 forever #50 clk = ~clk;
   end
	
	initial begin
        rst = 1;
        step = 4'd0;
        controller = 4'd0;
		  st = 4'd0;
        #100
        rst = 0;
        controller = 4'd1;
        #100
        controller = 4'd2;
        #100
        controller = 4'd3;
        #100
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
        #100
		  step = 4'd1;
        controller = 4'd1;
		  st = 4'd4;
        #100
        controller = 4'd2;
		  #100
		  controller = 4'd3;
		  #100
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
		  #100
		  step = 4'd2;
		  controller = 4'd1;
		  st = 4'd5;
		  #500;
    end
endmodule
