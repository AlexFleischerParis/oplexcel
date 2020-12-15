tuple t
{
  string name;
  int value;
}

{t} v=...;

subject to
{
  
}

{t} v2={<n,i+1> | <n,i> in v};
