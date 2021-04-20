/*

March 2021 IBM Ponder this challenge

https://www.research.ibm.com/haifa/ponderthis/challenges/March2021.html

*/

//using CP; // Both MIP and CP work fine here


int n=20;

range r=0..n-1;


string ch[r][r]=...;

// turn ch into v

int v[i in r][j in r];
execute parse
{
  for(var i in r) for(var j in r)
  { 
    var p1=ch[i][j].charAt(0);
    var p2=ch[i][j].charAt(1); 
    v[i][j]=-128+parseInt("0x"+p1+p2);  
  }
}

dvar boolean x[r][r];

// Find the maximum score
maximize sum(i,j in r) x[i][j]*v[i][j];
subject to
{
   
   // Surveying a cell is possible only if all its upper neighbors were already explored. 
   // The upper neighbors of (a,b) are defined as (a-1,b-1), (a-1,b), (a-1,b+1).
   
   forall(a,b in r,deltab in -1..1:((a-1) in r && (b+deltab) in r)) x[a][b]<=x[a-1][b+deltab];
}