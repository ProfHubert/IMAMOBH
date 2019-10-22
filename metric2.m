
A = [61
120
165
218
263
318
363
405
448
490
536
573
];




C = [100
200
300
400
500
600
700
800
900
1000
1100
1200
];

TP = A;
FP = C - A;


TPFN = 1209;
TNFP = 3770;
TN = TNFP - FP;
FN = TPFN - TP;
SN = TP./TPFN
SP = TN./TNFP
NPV = TN./(TN+FN)
PPV = TP./(TP+FP)

F = 2*SN.*PPV./(SN+PPV)
ACC = (TP+TN)./(TPFN+TNFP)

