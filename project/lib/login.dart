import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



void main() => runApp(new MyApp());
String _source,_destination;
var answer;
 final formKey = GlobalKey<FormState>();
 final formKey1= GlobalKey<FormState>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage1(),
    );
  }
}

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPageState1 createState() => new _LoginPageState1();
}

class _LoginPageState1 extends State<LoginPage1>{

 


 @override 

 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text(
          ('Railway Route Optimisation'),
          textAlign: TextAlign.end,),
          backgroundColor: Colors.black,
        ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget> [
          new Image(
            image: new AssetImage('assets/grey1.jpg'),
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 200,
                    decoration: BoxDecoration(
                      color:Colors.white,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: new TextFormField(
                              decoration :new InputDecoration( 
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                              ),
                              labelText: 'Enter the source',
                              labelStyle: TextStyle(color: Colors.black,fontFamily: 'Baloo',fontSize: 20.0),
                              focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12),
                                ),
                              ),
                              onSaved: (str)=> _source= str,
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,),
                    child: Form(
                      key: formKey1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: new TextFormField(
                              decoration :new InputDecoration( 
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)
                              ),
                              labelText: 'Enter the destination',
                              labelStyle: TextStyle(color: Colors.black,fontFamily: 'Baloo',fontSize: 20.0),
                              focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12),
                                ),
                              ),
                              onSaved: (str)=> _destination = str,
                            )
                          ),
                        ],
                      ),
                    )  
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondPage(),
                        ));
                      },
                      child: Text("submit"),
                    ),
                  )
                ],
              ),
            ]
        ),
          ),]
      )
    );
 }
}



void dijkstra(int n, int v, List<List<int>> matrix, List<int> dist)
{
  int i,k,count,min;
  List<int> visited=List(n);
  for(i=0;i<n;i++)
  {
    visited[i]=0;
    dist[i]=matrix[v][i];
  }
  visited[v]=1;
  dist[v]=0;
  count=2;
  while(count<n)
  {
    min=999;
    for(i=0;i<n;i++)
    {
      if(dist[i]<min && visited[i]==0)
      {
        min=dist[i];
        k=i;
      }
    }
    visited[k]=1;
    count++;
    for(i=0;i<n;i++)
    {
      if(visited[i]==0)
      {
        if(dist[i]>dist[k]+matrix[k][i])
        {
          dist[i]=dist[k]+matrix[k][i];
        }
      }
    }
  }
}

int _dijkstra(){
  formKey.currentState.save();
  formKey1.currentState.save();
  String start=_source;
  String end=_destination;
    List<String> cityNames=['mumbai','chennai','delhi','bangalore','kolkata','hydrabad'];
  List<int> dist= List(cityNames.length);

    
    List<List<int>> matrix=[[0,10,999,999,999,999],[10,0,20,999,40,60],[999,999,0,999,30,999],[999,50,999,0,130,999]
    ,[999,999,30,130,0,999],[100,999,999,120,999,0]];
    
  var v;
    for(var i=0;i<6;i++)
   {
     if (cityNames[i]==start)
      {
        v=i;
        break;
      }
   }

  dijkstra(6, v, matrix, dist);

  v=v+1;
  var q;
  for(var i=0;i<6;i++)
   {
     if (cityNames[i]==end)
      {
        q=i;
        break;
      }
   }

   return dist[q];
}

class SecondPage extends StatefulWidget{
  @override 

  _SecondPageState createState() => new _SecondPageState(); 
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin{


  TabController controller;

  @override 
  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Optimization routes"),
        backgroundColor: Colors.grey[850],
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget> [
            new Tab(icon: new Icon(Icons.streetview)),
            new Tab(icon: new Icon(Icons.timer)),
            new Tab(icon: new Icon(Icons.monetization_on),)
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget> [
          new SecondPage1(),
          new SecondPage1(),
          new SecondPage1(),
        ]
      ),
    );
  }
}

class SecondPage1 extends StatelessWidget {


  int answer=_dijkstra();


  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      body: Center(
        child: Text(
          "The Distance Between $_source and $_destination is $answer",
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oswald-VariableFont_wght'
          ),
        )
      ),
    );
  }
}