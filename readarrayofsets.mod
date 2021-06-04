range r=1..4;

string temp[r][1..26]=...;
{int} set[i in r]={ intValue(temp[i][j])| j in 1..26:temp[i][j]!=""};

execute
{
  writeln(set);
}

/*

which gives

[{1 2} {6} {7 8 9} {3 4}]

*/
