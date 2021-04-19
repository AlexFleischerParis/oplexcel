{string} Variante=...;
int Station=...;
int AP=...;


 
float nb[1..AP,1..Station*card(Variante)]=...;


float b[s in Variante][m in 1..AP][p in 1..Station]=nb[m,1+ord(Variante,s)*Station+(p-1)];
 execute {
   writeln("b = ",b);
}; 

/*

which gives

b =  [[[1 2 3]
             [3 3 4]]
         [[4 4 5]
             [2 3 4]]
         [[3 2 2]
             [1 3 4]]]
             
             */
