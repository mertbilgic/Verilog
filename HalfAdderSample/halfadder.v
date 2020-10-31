//: version "2.0-b10"
//: property encoding = "iso8859-1"
//: property locale = "en"
//: property prefix = "_GG"
//: property timingViolationMode = 2
//: property initTime = "0 ns"

`timescale 1ns/1ns

//: /netlistBegin main
module main;    //: root_module
reg w4;    //: /sn:0 {0}(187,201)(294,201)(294,215)(309,215){1}
reg w5;    //: /sn:0 {0}(189,259)(294,259)(294,231)(309,231){1}
wire w3;    //: /sn:0 {0}(398,215)(477,215)(477,178){1}
wire w2;    //: /sn:0 {0}(398,231)(515,231)(515,177){1}
//: enddecls

  //: LED g4 (w2) @(515,170) /sn:0 /w:[ 1 ] /type:0
  //: LED g3 (w3) @(477,171) /sn:0 /w:[ 1 ] /type:0
  //: SWITCH g2 (w5) @(172,259) /sn:0 /w:[ 0 ] /st:0 /dn:1
  //: SWITCH g1 (w4) @(170,201) /sn:0 /w:[ 0 ] /st:0 /dn:1
  half_adder g0 (.a(w4), .b(w5), .c(w3), .s(w2));   //: @(310, 199) /sz:(87, 48) /sn:0 /p:[ Li0>1 Li1>1 Ro0<0 Ro1<0 ]

endmodule
//: /netlistEnd

//: /hdlBegin half_adder
//: interface  /sz:(87, 48) /bd:[ Li0>b(32/48) Li1>a(16/48) Ro0<s(32/48) Ro1<c(16/48) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls
module half_adder(a,b,c,s);
  input a,b;
  output c,s;
  
  xor xor1(s,a,b);
  and and1(c,a,b);

endmodule
//: /hdlEnd


`timescale 1ns/1ns

