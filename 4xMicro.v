module shema( B0,B1,B2,B3,A0,A1,A2,A3,
 AddSub,IB_Alu3,IB_Alu2,IB_Alu1,IB_Alu0,Carry);
 input B0,B1,B2,B3,A0,A1,A2,A3;
 input AddSub;
 output IB_Alu3,IB_Alu2,IB_Alu1,IB_Alu0,Carry;
 wire w10,w11,w12,w17,w19,w20,w22,w23;
 wire w24,w25,w26,w27,w28,w29,w30,w31;
 mux #(7) mux_1(w19,A2,w17,AddSub);
 not #(6) inv_2(w17,A2);
 mux #(7) mux_3(w11,A0,w20,AddSub);
 mux #(7) mux_4(w23,A3,w22,AddSub);
 not #(6) inv_5(w22,A3);
 not #(6) inv_6(w24,A1);
 mux #(7) mux_7(w25,A1,w24,AddSub);
 not #(6) inv_8(w20,A0);
 mux #(7) mux_9(w10,vss,vdd,AddSub);
 xor #(8) xor2_1_10(w28,B0,w11);
 assign w12=(B0&w11)|(w10&(B0|w11))
 xor #(8) xor2_2_11(IB_Alu0,w28,w10);
 xor #(8) xor2_1_12(w29,B3,w23);
 assign Carry=(B3&w23)|(w26&(B3|w23))
 xor #(8) xor2_2_13(IB_Alu3,w29,w26);
 xor #(8) xor2_1_14(w30,B1,w25);
 assign w27=(B1&w25)|(w12&(B1|w25))
 xor #(8) xor2_2_15(IB_Alu1,w30,w12);
 xor #(8) xor2_1_16(w31,B2,w19);
 assign w26=(B2&w19)|(w27&(B2|w19))
 xor #(8) xor2_2_17(IB_Alu2,w31,w27);
endmodule

// Simulation parameters in Verilog Format
always
#200 AddSub=~AddSub;

// Simulation parameters
// B0 CLK 1 1
// B1 CLK 2 2
// B2 CLK 4 4
// B3 CLK 8 8
// A0 CLK 16 16
// A1 CLK 32 32
// A2 CLK 64 64
// A3 CLK 128 128
// AddSub CLK 256 256
