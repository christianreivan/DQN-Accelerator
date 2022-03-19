module state_to_matrix_module (
    st, in_layer_1, in_layer_2, in_layer_3,
    in_layer_4, in_layer_5, in_layer_6,
    in_layer_7, in_layer_8, in_layer_9
);
    input [3:0] st;
    output signed [15:0] in_layer_1, in_layer_2, in_layer_3,
                        in_layer_4, in_layer_5, in_layer_6,
                        in_layer_7, in_layer_8, in_layer_9;
    
    assign in_layer_1 = (st == 4'd1)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_2 = (st == 4'd2)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_3 = (st == 4'd3)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_4 = (st == 4'd4)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_5 = (st == 4'd5)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_6 = (st == 4'd6)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_7 = (st == 4'd7)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_8 = (st == 4'd8)? 16'b000001_0000000000 : 16'd0;
    assign in_layer_9 = (st == 4'd9)? 16'b000001_0000000000 : 16'd0;
endmodule