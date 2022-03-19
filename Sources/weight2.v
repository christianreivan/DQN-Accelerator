module weight2(
 input clk,
 input [3:0] st, ctrl, step,
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
 output signed [15:0] w2_1, w2_2, w2_3, w2_4, w2_5
 );
 
 reg signed[15:0] w21[0:8]; //w^2_11, w^2_21, w^2_31, ... , w^2_91
 reg signed[15:0] w22[0:8]; //w^2_12, w^2_22, w^2_32, ... , w^2_92
 reg signed[15:0] w23[0:8]; //w^2_13, w^2_23, w^2_33, ... , w^2_93
 reg signed[15:0] w24[0:8]; //w^2_14, w^2_24, w^2_34, ... , w^2_94
 reg signed[15:0] w25[0:8]; //w^2_15, w^2_25, w^2_35, ... , w^2_95
 
 initial begin
	 $readmemb("w2_1.mem", w21);
	 $readmemb("w2_2.mem", w22);
	 $readmemb("w2_3.mem", w23);
	 $readmemb("w2_4.mem", w24);
	 $readmemb("w2_5.mem", w25);
 end

 always @(posedge clk) begin
   if (step != 4'b0000) begin
     if (ctrl == 4'b0001) begin
		 w21[0] <= deltaw2_11 + w21[0];
		 w21[1] <= deltaw2_21 + w21[1];
		 w21[2] <= deltaw2_31 + w21[2];
		 w21[3] <= deltaw2_41 + w21[3];
		 w21[4] <= deltaw2_51 + w21[4];
		 w21[5] <= deltaw2_61 + w21[5];
		 w21[6] <= deltaw2_71 + w21[6];
		 w21[7] <= deltaw2_81 + w21[7];
		 w21[8] <= deltaw2_91 + w21[8];

		 w22[0] <= deltaw2_12 + w22[0];
		 w22[1] <= deltaw2_22 + w22[1];
		 w22[2] <= deltaw2_32 + w22[2];
		 w22[3] <= deltaw2_42 + w22[3];
		 w22[4] <= deltaw2_52 + w22[4];
		 w22[5] <= deltaw2_62 + w22[5];
		 w22[6] <= deltaw2_72 + w22[6];
		 w22[7] <= deltaw2_82 + w22[7];
		 w22[8] <= deltaw2_92 + w22[8];
		 
		 w23[0] <= deltaw2_13 + w23[0];
		 w23[1] <= deltaw2_23 + w23[1];
		 w23[2] <= deltaw2_33 + w23[2];
		 w23[3] <= deltaw2_43 + w23[3];
		 w23[4] <= deltaw2_53 + w23[4];
		 w23[5] <= deltaw2_63 + w23[5];
		 w23[6] <= deltaw2_73 + w23[6];
		 w23[7] <= deltaw2_83 + w23[7];
		 w23[8] <= deltaw2_93 + w23[8];
		 
		 w24[0] <= deltaw2_14 + w24[0];
		 w24[1] <= deltaw2_24 + w24[1];
		 w24[2] <= deltaw2_34 + w24[2];
		 w24[3] <= deltaw2_44 + w24[3];
		 w24[4] <= deltaw2_54 + w24[4];
		 w24[5] <= deltaw2_64 + w24[5];
		 w24[6] <= deltaw2_74 + w24[6];
		 w24[7] <= deltaw2_84 + w24[7];
		 w24[8] <= deltaw2_94 + w24[8];
		 
		 w25[0] <= deltaw2_15 + w25[0];
		 w25[1] <= deltaw2_25 + w25[1];
		 w25[2] <= deltaw2_35 + w25[2];
		 w25[3] <= deltaw2_45 + w25[3];
		 w25[4] <= deltaw2_55 + w25[4];
		 w25[5] <= deltaw2_65 + w25[5];
		 w25[6] <= deltaw2_75 + w25[6];
		 w25[7] <= deltaw2_85 + w25[7];
		 w25[8] <= deltaw2_95 + w25[8];
	  end
     
	  else begin
			w21[0] <= w21[0];
			w21[1] <= w21[1];
			w21[2] <= w21[2];
			w21[3] <= w21[3];
			w21[4] <= w21[4];
			w21[5] <= w21[5];
			w21[6] <= w21[6];
			w21[7] <= w21[7];
			w21[8] <= w21[8];

			w22[0] <= w22[0];
			w22[1] <= w22[1];
			w22[2] <= w22[2];
			w22[3] <= w22[3];
			w22[4] <= w22[4];
			w22[5] <= w22[5];
			w22[6] <= w22[6];
			w22[7] <= w22[7];
			w22[8] <= w22[8];
			
			w23[0] <= w23[0];
			w23[1] <= w23[1];
			w23[2] <= w23[2];
			w23[3] <= w23[3];
			w23[4] <= w23[4];
			w23[5] <= w23[5];
			w23[6] <= w23[6];
			w23[7] <= w23[7];
			w23[8] <= w23[8];
			
			w24[0] <= w24[0];
			w24[1] <= w24[1];
			w24[2] <= w24[2];
			w24[3] <= w24[3];
			w24[4] <= w24[4];
			w24[5] <= w24[5];
			w24[6] <= w24[6];
			w24[7] <= w24[7];
			w24[8] <= w24[8];
			
			w25[0] <= w25[0];
			w25[1] <= w25[1];
			w25[2] <= w25[2];
			w25[3] <= w25[3];
			w25[4] <= w25[4];
			w25[5] <= w25[5];
			w25[6] <= w25[6];
			w25[7] <= w25[7];
			w25[8] <= w25[8];
     	   end
   end
   
   else begin
		    w21[0] <= w21[0];
			w21[1] <= w21[1];
			w21[2] <= w21[2];
			w21[3] <= w21[3];
			w21[4] <= w21[4];
			w21[5] <= w21[5];
			w21[6] <= w21[6];
			w21[7] <= w21[7];
			w21[8] <= w21[8];

			w22[0] <= w22[0];
			w22[1] <= w22[1];
			w22[2] <= w22[2];
			w22[3] <= w22[3];
			w22[4] <= w22[4];
			w22[5] <= w22[5];
			w22[6] <= w22[6];
			w22[7] <= w22[7];
			w22[8] <= w22[8];
			
			w23[0] <= w23[0];
			w23[1] <= w23[1];
			w23[2] <= w23[2];
			w23[3] <= w23[3];
			w23[4] <= w23[4];
			w23[5] <= w23[5];
			w23[6] <= w23[6];
			w23[7] <= w23[7];
			w23[8] <= w23[8];
			
			w24[0] <= w24[0];
			w24[1] <= w24[1];
			w24[2] <= w24[2];
			w24[3] <= w24[3];
			w24[4] <= w24[4];
			w24[5] <= w24[5];
			w24[6] <= w24[6];
			w24[7] <= w24[7];
			w24[8] <= w24[8];
			
			w25[0] <= w25[0];
			w25[1] <= w25[1];
			w25[2] <= w25[2];
			w25[3] <= w25[3];
			w25[4] <= w25[4];
			w25[5] <= w25[5];
			w25[6] <= w25[6];
			w25[7] <= w25[7];
			w25[8] <= w25[8];
   		end
 end


assign w2_1 = w21[st];
assign w2_2 = w22[st];
assign w2_3 = w23[st];
assign w2_4 = w24[st];
assign w2_5 = w25[st];
 
endmodule
