// Read from an Excel spreadsheet without SheetRead
// which means you can use this on non Windows platform

execute
    {

    function read_excel(filename,sheetname,skiprows,nrows,cols,datfilename,resname)
    {
        var quote="\"";
        
        var python=new IloOplOutputFile("c:\\temp\\readexcel.py");
        
        python.writeln("import pandas as pd");
        python.writeln("import xlrd");
        python.writeln("df=pd.read_excel('"+filename+"'"+",sheet_name = '"+sheetname+"'"+
        ",skiprows = "+skiprows+  ",nrows= "+nrows+ ","
        +"header=None,usecols = '"+cols+"')");
        python.writeln("print(df)");
        
        
        
        python.writeln("res = open(",quote,datfilename,quote,",",quote,"w",quote,")");
        python.writeln("res.write(",quote,resname,"=[",quote,")");
        python.writeln("res.write(",quote,"\\","n",quote,")");
        python.writeln("for i, row in enumerate(df.values):");
       
        python.writeln("   res.write(",quote,"[",quote,")");
        
        python.writeln("   for j in row:");
       
        python.writeln("      if (j==j):");
        python.writeln("         res.write(str(j))");
        python.writeln("         res.write(\",\")");
       
        python.writeln("   res.write(\"],\")    ");
        python.writeln("   res.write(",quote,"\\","n",quote,")");
        python.writeln("res.write(\"];\")");
        python.writeln("res.close()");
        python.close();
       
        python.close();
        
        IloOplExec("C:\\Python36\\python.exe c:\\temp\\readexcel.py",true);
        
    }
    read_excel("c:\\\\temp\\\\read2Darray.xls","Sheet1",0,2,"B:D","c:\\\\temp\\\\resexcel","res");
}    

/*

which gives in res.txt

res=[
[5,6,7,],
[8,9,10,],
];

*/