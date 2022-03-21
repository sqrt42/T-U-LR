var x11 >=0; var x12 >=0; var x13 >=0; var x14 >=0;
var x21 >=0; var x22 >=0; var x23 >=0; var x24 >=0;
var x31 >=0; var x32 >=0; var x33 >=0; var x34 >=0;

minimize F: 5*x11 + 7*x12 + 4*x13 + 2*x14 + 7*x21 + 1*x22 + 3*x23 + 1*x24 + 2*x31 + 3*x32 + 6*x33 + 8*x34;

s.t. U1: x11+x12+x13+x14 = 215;
s.t. U2: x21+x22+x23+x24 = 190;
s.t. U3: x31+x32+x33+x34 = 240;

s.t. V1: x11+x21+x31 <= 300;
s.t. V2: x12+x22+x32 <= 130;
s.t. V3: x13+x23+x33 <= 120;
s.t. V4: x14+x24+x34 <= 140;

solve;
display F;

display x11, x12, x13, x14;
display x21, x22, x23, x24;
display x31, x32, x33, x34;