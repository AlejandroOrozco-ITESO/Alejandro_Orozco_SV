module mux_2to1( sel, d, d2, q );
 parameter  DW= 4;
 input logic [1:0] sel;
 input logic [DW-1:0] d;
 input logic [DW-1:0] d2;
 output logic [DW-1:0] q;

 assign q =(sel) ? d : d2;

endmodule 
 
