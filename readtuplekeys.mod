tuple Lot{key int id; int n; float w;}
tuple Stp{key Lot l; key int pos; int f;}

{Lot} Lots = ...;
{Stp} Stps = ...;

execute
{
  writeln(Stps);
}

/*

gives

{<<1 60 0.4> 1 1> <<1 60 0.4> 2 2>}

*/
