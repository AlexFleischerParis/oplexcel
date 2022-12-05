    
    int maxA=2;
    int maxB=3;
    int maxC=4;
    
    range A=1..maxA;
    range B=1..maxB;
    range C=1..maxC;


    dvar int X[A][B][C];

    subject to
    {
    forall(a in A,b in B,c in C) X[a][b][c]==a*b*c;
    }
    
    range r=1..maxA*maxB*maxC;

    int result[i in r]=
    X[(i-1) div (maxB*maxC)+1][((i-1)-maxB*maxC*((i-1) div (maxB*maxC))) div maxC+1][(i-1) mod maxC+1];
    
    

    
