main
{
  var source = new IloOplModelSource("variablesheetreadstring.mod");
  var cplex = new IloCplex();
  var def = new IloOplModelDefinition(source);
  var opl = new IloOplModel(def,cplex);
  var data1=new IloOplDataElements();
  
  data1.paramread="params!A2";
  data1.parambuses="buses!A2:B3";
  data1.paramwrite="buses!E2:F3";
  
  opl.addDataSource(data1);
  
  var data2 = new IloOplDataSource("variablesheetreadstring.dat");
  opl.addDataSource(data2);
  opl.generate();
  if (cplex.solve()) {
     writeln("OBJ = " + cplex.getObjValue());
     opl.postProcess();

  } else {
     writeln("No solution");
  }
  

  opl.end();
  
  
}
