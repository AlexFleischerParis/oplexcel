

    range A=1..2;
    range B=1..3;
    range C=1..4;


    dvar int X[A][B][C];

    subject to
    {
    forall(a in A,b in B,c in C) X[a][b][c]==a*b*c;
    }

    tuple someTuple{
    int a;
    int b;
    int c;
    int value;
    };


    {someTuple} someSet = {<i,j,k,X[i][j][k]> | i in A, j in B, k in C}; 
