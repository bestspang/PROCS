import de.bezier.data.sql.*; // add sql lib
MySQL msql; // initialize
ConnectSQL cn;
Table table;
String  url      = "localhost:8889";
String  user     = "root";
String  pass     = "root";
String  database = "new_schema";
StringList list = new StringList();
String[][] test;

float timer=0;
void setup() {
  size(640,480);
  background(255);
  msql = new MySQL( this, "localhost:8889", database, user, pass );
  cn = new ConnectSQL();
  table = loadTable("movement.csv", "header");
  int rows = table.getRowCount();
  int columns = table.getColumnCount();
  test = new String[rows][columns];
  print(test[98][0]);
  //cn.dbPrintLastest();
  //print(cn.dbGet());
  list = new StringList(cn.dbGet());
  //String[] a = list;
  /*print(list.size());
  for (int i = 0; i < list.size(); i++){
    print(list);
  }*/
  
  
}

void draw() {
  background(255);
  strokeWeight(3);
  stroke(255);
  
  //point();
 
}

///////////////////////////////////////////////////////////
class ConnectSQL
{
///////////////////////////////////////////////////////////
  public StringList dbGet() {
    //String[] a = new String[];
    StringList a = new StringList();
    //String a = "";
  if ( msql.connect() )
    {
        msql.query( "SELECT * FROM Coordinate" );
        while (msql.next()){
          a.append(msql.getInt(1)+ ","
          + msql.getString(2)+ ","
          + msql.getString(3)); 
      };
      return a;
    }
    else
    { a.append("connection failed !"); return a;}
    }
       
  public void dbGetLastest() {
  if ( msql.connect() )
    {
        msql.query( "SELECT * FROM Coordinate ORDER BY id DESC LIMIT 1;" );
        while (msql.next()){
        println( msql.getInt(1)+", "+ msql.getString(2)
          +", "+ msql.getString(3)+", "+ millis()/1000 );
      };
    }else{ println("connection failed !");}
    }
    
    public void dbCount() {
  if ( msql.connect() )
    {
        msql.query( "SELECT COUNT(*) FROM Coordinate" );
        while (msql.next()){
        int a = msql.getInt(1);
        println ( "count: " + a );
      };
    }else{ println("connection failed !");}
    }
    
  public void dbReset() {
  if ( msql.connect() )
    {
        msql.query( "TRUNCATE TABLE Coordinate" );
        println("reset data completed!");
    }else{ println("connection failed !");}
    }    
///////////////////////////////////////////////////////////
}
///////////////////////////////////////////////////////////