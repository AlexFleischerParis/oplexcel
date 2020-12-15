int n=2;
int m=3;

int ar[1..n][1..m]=...;
{int} se=...;

int subar[1..2]=...;
int subar2[1..2]=...;

subject to
{
  
}

{int} se2= {i+1 | i in se};
int ar2[i in 1..n][j in 1..m]=ar[i][j]+1;

execute
{
  writeln("subar=",subar);
  writeln("subar2=",subar2);
}

