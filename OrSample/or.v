//: version "2.0-b10"
//: property encoding = "iso8859-1"
//: property locale = "en"
//: property prefix = "_GG"
//: property timingViolationMode = 2
//: property initTime = "0 ns"

`timescale 1ns/1ns

//: /netlistBegin main
module main;    //: root_module
reg w6;    //: /sn:0 {0}(298,211)(389,211)(389,182)(419,182){1}
reg w4;    //: /sn:0 {0}(313,129)(404,129)(404,150)(419,150){1}
reg w5;    //: /sn:0 {0}(296,169)(387,169)(387,166)(419,166){1}
wire w3;    //: /sn:0 {0}(477,150)(573,150)(573,104){1}
//: enddecls

  //: LED g4 (w3) @(573,97) /sn:0 /w:[ 1 ] /type:0
  //: SWITCH g3 (w6) @(281,211) /sn:0 /w:[ 0 ] /st:0 /dn:1
  //: SWITCH g2 (w5) @(279,169) /sn:0 /w:[ 0 ] /st:0 /dn:1
  //: SWITCH g1 (w4) @(296,129) /sn:0 /w:[ 0 ] /st:0 /dn:1
  or3 g0 (.a(w4), .b(w5), .c(w6), .y(w3));   //: @(420, 134) /sz:(56, 64) /sn:0 /p:[ Li0>1 Li1>1 Li2>1 Ro0<0 ]

endmodule
//: /netlistEnd

//: /hdlBegin or3
//: interface  /sz:(56, 64) /bd:[ Li0>c(48/64) Li1>b(32/64) Li2>a(16/64) Ro0<y(16/64) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls
module or3(a,b,c,y);
  input a;
  input b;
  input c;
  output y;
  
  wire w1;
  
  or or1(w1,a,b);
  or or2(y,w1,c);

endmodule
//: /hdlEnd


`timescale 1ns/1ns

