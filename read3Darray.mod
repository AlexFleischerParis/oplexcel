range A=1..2;
range B=1..3;
range C=1..4;


tuple someTuple{
    key int a;
    key int b;
    key int c;
    int value;
    };
    

{someTuple} someSet = ...;

int v[a in A][b in B][c in C]=item(someSet,<a,b,c>).value;

dvar int X[A][B][C];

subject to
{
    forall(a in A,b in B,c in C) X[a][b][c]==v[a][b][c];
}


assert forall(a in A,b in B,c in C) X[a][b][c]==a*b*c;