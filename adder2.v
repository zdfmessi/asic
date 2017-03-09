/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Feb 14 21:51:44 2017
// outhor    : zdfmessi	
/////////////////////////////////////////////////////////////


module adder ( clk, rstn, a, b, out );
  input [3:0] a;
  input [3:0] b;
  output [4:0] out;
  input clk, rstn;
  wire   N3, N4, N5, N6, N7;
  wire   [4:1] \add_35/carry ;

  DFFTRX1 \out_reg[4]  ( .D(N7), .RN(rstn), .CK(clk), .Q(out[4]) );
  DFFTRX1 \out_reg[3]  ( .D(N6), .RN(rstn), .CK(clk), .Q(out[3]) );
  DFFTRX1 \out_reg[2]  ( .D(N5), .RN(rstn), .CK(clk), .Q(out[2]) );
  DFFTRX1 \out_reg[1]  ( .D(N4), .RN(rstn), .CK(clk), .Q(out[1]) );
  DFFTRX1 \out_reg[0]  ( .D(N3), .RN(rstn), .CK(clk), .Q(out[0]) );
  ADDFX2 U3 ( .A(a[1]), .B(b[1]), .CI(\add_35/carry [1]), .CO(
        \add_35/carry [2]), .S(N4) );
  ADDFX2 U4 ( .A(a[2]), .B(b[2]), .CI(\add_35/carry [2]), .CO(
        \add_35/carry [3]), .S(N5) );
  ADDFX2 U5 ( .A(a[3]), .B(b[3]), .CI(\add_35/carry [3]), .CO(N7), .S(N6) );
  AND2X1 U6 ( .A(a[0]), .B(b[0]), .Y(\add_35/carry [1]) );
  XOR2X1 U7 ( .A(b[0]), .B(a[0]), .Y(N3) );
endmodule

