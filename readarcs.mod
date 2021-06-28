tuple arcE
{
 string o;
 string d;
}

{arcE} arcsInExcel=...;

{int} orig={ intValue(a.o) | a in arcsInExcel};

{int} destPerOrig[o in orig]={intValue(a.d) | a in arcsInExcel : intValue(a.o)==o && a.d!="" };

execute
{
  writeln(orig);
  writeln("==>");
  writeln(destPerOrig);
}

/*
which gives

 {44 66}
==>
 [{2 3 4} {}]
*/

