range A=1..2;
range B=1..3;
range C=1..4;
range D=1..2;


tuple someTuple{
    key int a;
    key int b;
    key int c;
    key int d;
    int value;
    };
    

{someTuple} someSet = ...;

int v[a in A][b in B][c in C][d in D]=item(someSet,<a,b,c,d>).value;

dvar int X[A][B][C][D];

subject to
{
    forall(a in A,b in B,c in C,d in D) X[a][b][c][d]==v[a][b][c][d];
}


assert forall(a in A,b in B,c in C,d in D) X[a][b][c][d]==a*b*c*d;