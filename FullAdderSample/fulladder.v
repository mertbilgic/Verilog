//: version "2.0-b10"
//: property encoding = "iso8859-1"
//: property locale = "en"
//: property prefix = "_GG"
//: property timingViolationMode = 2
//: property initTime = "0 ns"

`timescale 1ns/1ns

//: /netlistBegin main
module main;    //: root_module
reg w6;    //: /sn:0 {0}(149,144)(243,144){1}
reg w7;    //: /sn:0 {0}(173,188)(228,188)(228,160)(243,160){1}
reg w5;    //: /sn:0 {0}(177,105)(228,105)(228,128)(243,128){1}
wire w4;    //: /sn:0 {0}(368,128)(408,128)(408,115){1}
wire w3;    //: /sn:0 {0}(368,144)(441,144)(441,115){1}
//: enddecls

  //: LED g4 (w4) @(408,108) /sn:0 /w:[ 1 ] /type:0
  //: SWITCH g3 (w7) @(156,188) /sn:0 /w:[ 0 ] /st:1 /dn:1
  //: SWITCH g2 (w6) @(132,144) /sn:0 /w:[ 0 ] /st:1 /dn:1
  //: SWITCH g1 (w5) @(160,105) /sn:0 /w:[ 0 ] /st:1 /dn:1
  //: LED g5 (w3) @(441,108) /sn:0 /w:[ 1 ] /type:0
  full_adder g0 (.a(w5), .b(w6), .cin(w7), .cout(w4), .s(w3));   //: @(244, 112) /sz:(123, 64) /sn:0 /p:[ Li0>1 Li1>1 Li2>1 Ro0<0 Ro1<0 ]

endmodule
//: /netlistEnd

//: /hdlBegin full_adder
//: interface  /sz:(123, 64) /bd:[ Li0>cin(48/64) Li1>b(32/64) Li2>a(16/64) Ro0<s(32/64) Ro1<cout(16/64) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
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

