    int maxA=2;
    int maxB=3;
    int maxC=4;
    
    range A=1..maxA;
    range B=1..maxB;
    range C=1..maxC;
    
    range r=1..maxA*maxB*maxC;
    
    int input[r]=...;
    int input3D[a in A][b in B][c in C]=input[(a-1)*maxB*maxC+(b-1)*maxC+c-1+1];   
   


    dvar int X[A][B][C];

    subject to
    {
     forall(a in A,b in B,c in C) X[a][b][c]==input3D[a][b][c];
    }

    assert forall(a in A,b in B,c in C) X[a][b][c]==a*b*c;