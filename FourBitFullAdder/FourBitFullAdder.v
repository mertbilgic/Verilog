//: version "2.0-b10"
//: property encoding = "iso8859-1"
//: property locale = "en"
//: property prefix = "_GG"
//: property title = "FourBitFullAdder.v"
//: property timingViolationMode = 2
//: property initTime = "0 ns"

`timescale 1ns/1ns

//: /netlistBegin main
module main;    //: root_module
reg w7;    //: /sn:0 {0}(74,362)(240,362)(240,331)(286,331){1}
reg [3:0] w1;    //: /sn:0 {0}(286,294)(189,294)(#:189,234){1}
reg [3:0] w8;    //: /sn:0 {0}(#:87,288)(87,315)(286,315){1}
wire w10;    //: /sn:0 {0}(441,299)(485,299)(485,273){1}
wire [3:0] w9;    //: /sn:0 {0}(#:441,315)(525,315)(525,276){1}
//: enddecls

  //: DIP g8 (w8) @(87,278) /sn:0 /w:[ 0 ] /st:15 /dn:1
  //: LED g11 (w10) @(485,266) /sn:0 /w:[ 1 ] /type:0
  //: LED g10 (w9) @(525,269) /sn:0 /w:[ 1 ] /type:1
  //: DIP g6 (w1) @(189,224) /sn:0 /w:[ 1 ] /st:15 /dn:1
  //: SWITCH g9 (w7) @(57,362) /sn:0 /w:[ 0 ] /st:1 /dn:1
  four_bit_full_adder g7 (.a(w1), .b(w8), .c0(w7), .c4(w10), .s(w9));   //: @(287, 283) /sz:(153, 64) /sn:0 /p:[ Li0>0 Li1>1 Li2>1 Ro0<0 Ro1<0 ]

endmodule
//: /netlistEnd

//: /hdlBegin half_adder
//: interface  /sz:(40, 40) /bd:[ ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls
module half_adder(a,b,c,s);
  input a,b;
  output c,s;
  
  xor xor1(s,a,b);
  and and1(c,a,b);

endmodule

//: /hdlEnd


`timescale 1ns/1ns

//: /hdlBegin full_adder
//: interface  /sz:(123, 64) /bd:[ Li0>a(16/64) Li1>b(32/64) Li2>cin(48/64) Ro0<cout(16/64) Ro1<s(32/64) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls
module full_adder(a,b,cin,cout,s);
  input a,b,cin;
  output cout,s;
  wire w1,w2,w3;
  
  half_adder ha1(.a(a),.b(b),.c(w1),.s(w2));
  half_adder ha2(.a(w2),.b(cin),.c(w3),.s(s));
  or or1(cout,w1,w3);

endmodule
//: /hdlEnd


`timescale 1ns/1ns

//: /hdlBegin four_bit_full_adder
//: interface  /sz:(153, 64) /bd:[ Li0>c0(48/64) Li1>b[3:0](32/64) Li2>a[3:0](11/64) Ro0<s[3:0](32/64) Ro1<c4(16/64) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls
module four_bit_full_adder(a,b,c0,c4,s);
  
  input [3:0] a,b;
  input c0;
  output [3:0] s;
  output c4;
  
  wire c1,c2,c3;
  
  full_adder fa1(a[0],b[0],c0,c1,s[0]);
  full_adder fa2(a[1],b[1],c1,c2,s[1]);
  full_adder fa3(a[2],b[2],c2,c3,s[2]);
  full_adder fa3(a[3],b[3],c3,c4,s[3]);
  
endmodule
//: /hdlEnd


`timescale 1ns/1ns

