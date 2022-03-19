module weight3(
 input clk,
 input [3:0] ctrl, step,
 input signed [15:0] deltaw3_11, deltaw3_12, deltaw3_13, deltaw3_14,
 input signed [15:0] deltaw3_21, deltaw3_22, deltaw3_23, deltaw3_24,
 input signed [15:0] deltaw3_31, deltaw3_32, deltaw3_33, deltaw3_34,
 input signed [15:0] deltaw3_41, deltaw3_42, deltaw3_43, deltaw3_44,
 input signed [15:0] deltaw3_51, deltaw3_52, deltaw3_53, deltaw3_54,
 output signed [15:0] w3_11, w3_12, w3_13, w3_14,
                      w3_21, w3_22, w3_23, w3_24,
					  w3_31, w3_32, w3_33, w3_34,
					  w3_41, w3_42, w3_43, w3_44,
					  w3_51, w3_52, w3_53, w3_54
 );
 
 reg signed[15:0] w31[0:4]; //w^3_11, w^3_21, w^3_31, w^3_41, w^3_51
 reg signed[15:0] w32[0:4]; //w^3_12, w^3_22, w^3_32, w^3_42, w^3_52
 reg signed[15:0] w33[0:4]; //w^3_13, w^3_23, w^3_33, w^3_43, w^3_53
 reg signed[15:0] w34[0:4]; //w^3_14, w^3_24, w^3_34, w^3_44, w^3_54
 
 initial begin
	 $readmemb("w3_1.mem", w31);
	 $readmemb("w3_2.mem", w32);
	 $readmemb("w3_3.mem", w33);
	 $readmemb("w3_4.mem", w34);
 end
 
 always @(posedge clk) begin
   if (step != 4'b0000) begin //as long as current step is not in position 0 (reset)
     if (ctrl == 4'b0011) begin //as long as current controller is in position 3 (before z3 calculation)
		 w31[0] <= deltaw3_11 + w31[0];
		 w31[1] <= deltaw3_21 + w31[1];
		 w31[2] <= deltaw3_31 + w31[2];
		 w31[3] <= deltaw3_41 + w31[3];
		 w31[4] <= deltaw3_51 + w31[4];
		 
		 w32[0] <= deltaw3_12 + w32[0];
		 w32[1] <= deltaw3_22 + w32[1];
		 w32[2] <= deltaw3_32 + w32[2];
		 w32[3] <= deltaw3_42 + w32[3];
		 w32[4] <= deltaw3_52 + w32[4];
		 
		 w33[0] <= deltaw3_13 + w33[0];
		 w33[1] <= deltaw3_23 + w33[1];
		 w33[2] <= deltaw3_33 + w33[2];
		 w33[3] <= deltaw3_43 + w33[3];
		 w33[4] <= deltaw3_53 + w33[4];
		 
		 w34[0] <= deltaw3_13 + w34[0];
		 w34[1] <= deltaw3_23 + w34[1];
		 w34[2] <= deltaw3_33 + w34[2];
		 w34[3] <= deltaw3_43 + w34[3];
		 w34[4] <= deltaw3_53 + w34[4];
	  end
     
	  else begin
			w31[0] <= w31[0];
			w31[1] <= w31[1];
			w31[2] <= w31[2];
			w31[3] <= w31[3];
			w31[4] <= w31[4];
			
			w32[0] <= w32[0];
			w32[1] <= w32[1];
			w32[2] <= w32[2];
			w32[3] <= w32[3];
			w32[4] <= w32[4];
			
			w33[0] <= w33[0];
			w33[1] <= w33[1];
			w33[2] <= w33[2];
			w33[3] <= w33[3];
			w33[4] <= w33[4];
			
			w34[0] <= w34[0];
			w34[1] <= w34[1];
			w34[2] <= w34[2];
			w34[3] <= w34[3];
			w34[4] <= w34[4];
	  end
   end
   
   else begin
	        w31[0] <= w31[0];
			w31[1] <= w31[1];
			w31[2] <= w31[2];
			w31[3] <= w31[3];
			w31[4] <= w31[4];
			
			w32[0] <= w32[0];
			w32[1] <= w32[1];
			w32[2] <= w32[2];
			w32[3] <= w32[3];
			w32[4] <= w32[4];
			
			w33[0] <= w33[0];
			w33[1] <= w33[1];
			w33[2] <= w33[2];
			w33[3] <= w33[3];
			w33[4] <= w33[4];
			
			w34[0] <= w34[0];
			w34[1] <= w34[1];
			w34[2] <= w34[2];
			w34[3] <= w34[3];
			w34[4] <= w34[4];
        end
 end

//assign each weight to #1 output node
assign w3_11 = w31[0];
assign w3_21 = w31[1];
assign w3_31 = w31[2];
assign w3_41 = w31[3];
assign w3_51 = w31[4];

//assign each weight to #2 output node
assign w3_12 = w32[0];
assign w3_22 = w32[1];
assign w3_32 = w32[2];
assign w3_42 = w32[3];
assign w3_52 = w32[4];

//assign each weight to #3 output node
assign w3_13 = w33[0];
assign w3_23 = w33[1];
assign w3_33 = w33[2];
assign w3_43 = w33[3];
assign w3_53 = w33[4];

//assign each weight to #4 output node
assign w3_14 = w34[0];
assign w3_24 = w34[1];
assign w3_34 = w34[2];
assign w3_44 = w34[3];
assign w3_54 = w34[4];

endmodule
