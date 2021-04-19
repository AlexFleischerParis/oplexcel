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

// Display
execute
{
  write("[");
  for(var i in r) for(var j in r) if (x[i][j]==1) write("(",i,",",j,"),");
  
    writeln("]");
}

/*

which gives

 // solution with objective 1424
 
[(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10),(0,11),(0,12),(0,13),(0,14),(0,15),
(0,16),(0,17),(0,18),(0,19),(1,0),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),
(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(2,0),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),
(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(3,0),(3,1),(3,2),(3,3),
(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(4,0),
(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),
(4,17),(5,0),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),
(5,15),(5,16),(6,0),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,12),(6,14),(6,15),(7,0),
(7,1),(7,2),(7,4),(7,7),(8,0),(8,1),(9,0),]


*/
