{int} x=...;
{int} y=...;

{string} figures={"0","1","2","3","4","5","6","7","8","9"};

string cells[x][y]=...;


{int} values[x][y];

execute // parsing
{
  for(var i in x) for(var j in y)
  {
    
    var s=cells[i][j];
    var buffer="";
    
    for(var k=0;k<s.length;k++) 
    {
     
      if (figures.contains(s.charAt(k))) buffer=buffer+s.charAt(k);
      else
      {
        if (buffer!="")
        {
          var value=Opl.intValue(buffer);
          values[i][j].add(value);
          buffer="";
        }
      }
    }
  
  }
  
}

execute display
{
  for(var i in x) for(var j in y) if (Opl.card(values[i][j])!=0) writeln(i,",",j," => ",values[i][j]);
}

/*

which gives

2,12 =>  {4 5}
10,40 =>  {6}

*/
