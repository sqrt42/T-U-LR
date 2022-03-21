param n;
param m;

set I= 1..m;
set J= 1..n;

param c{J};
param b{I};
param a{I,J};

var x{J} >=0;

maximize F: sum {j in J} c[j] * x[j];
subject to y{i in I}: sum {j in J} a[i,j] * x[j] <= b[i];
	  
	  
