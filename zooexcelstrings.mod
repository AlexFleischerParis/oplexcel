/*

Sometimes we do not know exactly what the spreadsheets looks like and we need to parse it out of string content

*/

    string excelstrings[1..100][1..26]=...;
    
    assert excelstrings[1][1]=="nbKids";
    assert excelstrings[1][2]=="zizeBuses";
    assert excelstrings[1][3]=="costBuses";
    
    int nbKids=atoi(excelstrings[2][1]);
    

    // a tuple is like a struct in C, a class in C++ or a record in Pascal
    tuple bus
    {
    key int nbSeats;
    float cost;
    }

    // This is a tuple set
    {bus} buses={ <intValue(excelstrings[i][2]),floatValue(excelstrings[i][3])>|i in 2..100 :excelstrings[i][2]!=""};

    // asserts help make sure data is fine
    assert forall(b in buses) b.nbSeats>0;
    assert forall(b in buses) b.cost>0;

    // decision variable array
    dvar int+ nbBus[buses];

    // objective
    minimize
     sum(b in buses) b.cost*nbBus[b];
     
    // constraints
    subject to
    {
     sum(b in buses) b.nbSeats*nbBus[b]>=nbKids;
    }

    // output 
    execute
    {
     excelstrings[1][5]="result";
     for(var b in buses) excelstrings[Opl.ord(buses,b)+2][5]=nbBus[b];
     
   }     
    

/*

and in the .dat we have

SheetConnection s("zoo.xlsx");

excelstrings from SheetRead(s,"A1:Z100");
excelstrings to SheetWrite(s,"A1:Z100");

*/