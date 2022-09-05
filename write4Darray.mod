    range A=1..2;
    range B=1..3;
    range C=1..4;
    range D=1..2;


    dvar int X[A][B][C][D];

    subject to
    {
    forall(a in A,b in B,c in C,d in D) X[a][b][c][d]==a*b*c*d;
    }

    tuple someTuple{
    int a;
    int b;
    int c;
    int d;
    int value;
    };


    {someTuple} someSet = {<i,j,k,l,X[i][j][k][l]> | i in A, j in B, k in C,l in D}; 
