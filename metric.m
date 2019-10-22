
A = [10
22
32
38
52
59
71
83
99
];




C = [50
100
150
200
250
300
350
400
450];

TP = A;
FP = C - A;


TPFN = 444;
TNFP = 2084;
TN = TNFP - FP;
FN = TPFN - TP;
SN = TP./TPFN
SP = TN./TNFP
NPV = TN./(TN+FN)
PPV = TP./(TP+FP)

F = 2*SN.*PPV./(SN+PPV)
ACC = (TP+TN)./(TPFN+TNFP)

