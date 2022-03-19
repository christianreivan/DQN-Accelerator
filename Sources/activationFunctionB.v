module activationFunctionB(clk, rst, ctrl, z, dout);
 input clk;
 input rst;
 input [3:0] ctrl;
 input signed [15:0] z;
 output signed [15:0] dout;
 
 //wires and regs
 reg [15:0] a1;
 
 always @(posedge clk) begin
  if (rst == 1'b1) begin
    a1 <= 16'd0;
  end
  
  else
  begin
    if (ctrl == 4'b0101)
      begin
        if (z[15] == 1'b1) 
          begin
            if ((-z) > 16'b000101_0000000000)
            begin
              a1 <= 16'd0;
            end
            else if (((-z) > 16'b000010_0110000000) && ((-z) < 16'b000101_0000000000)) 
              a1 <= (16'b000001_0000000000)-(((-z) >> 5) + 16'b000000_1101100000);
            else if (((-z) > 16'b000001_0000000000) && ((-z) < 16'b000010_0110000000))
              a1 <= (16'b000001_0000000000)-(((-z) >> 3) + 16'b000000_1010000000);
            else
              a1 <= (16'b000001_0000000000)-(((-z) >> 2) + 16'b000000_1000000000);
          end
        else if (z[15] == 1'b0)
          begin
            if (z > 16'b000101_0000000000)
              a1 <= 16'b000001_0000000000;
            else if ((z > 16'b000010_0110000000) && (z < 16'b000101_0000000000))
              a1 <= (z>>5) + 16'b000000_1101100000;
            else if ((z > 16'b000001_0000000000) && (z < 16'b000010_0110000000))
              a1 <= (z>>3) + 16'b000000_1010000000;
            else
              a1 <= (z>>2) + 16'b000000_1000000000;
          end
        else
          begin
            a1 <= a1;
          end
      end

    else
      begin
        a1 <= a1;
      end
  end
 end

assign dout = a1;

endmodule
