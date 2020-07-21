import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';


void main() => runApp(new Login());
String _source,_destination;
var answer;
 final formKey = GlobalKey<FormState>();
 final formKey1= GlobalKey<FormState>();
 List<int> path = [];
 List<String> cityNames = ['Delhi', 'Gorakhpur', 'Guhwahati', 'Sealdah', 'Howrah', 'Secunderabad', 'Chennai', 'Mumbai', 'Hubbali', 'Jaipur', 
                            'Jabalpur', 'Allahabad', 'Bilaspur', 'Bhubaneshwar', 'Vishakapatnam', 'Hajipur' ];

List<LatLng> coordinates = [LatLng(28.7041,77.1025),LatLng(26.7606,83.3732),LatLng(26.1445,91.7362),LatLng(22.5676,88.3707),LatLng(22.5958,88.2636),
                            LatLng(17.4399,78.4983),LatLng(13.0827,80.2707),LatLng(13.0827, 80.2707 ),LatLng(15.3647, 75.1240),LatLng(26.9124, 75.7873)
                            ,LatLng(23.1815, 79.9864),LatLng(23.1815, 79.9864),LatLng(22.0797, 82.1409),LatLng(20.2961, 85.8245),LatLng(17.6868, 83.2185)
                            ,LatLng(25.6924, 85.2083)];
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
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
        body: Stack(
        fit: StackFit.expand,
        children: <Widget> [
          new Image(
            image: new AssetImage('assets/image2.jpg'),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: 150,
                    decoration: BoxDecoration(
                      color:Colors.grey[200],
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
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],),
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
                    padding: EdgeInsets.all(50.0),
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



class SecondPage extends StatefulWidget{
  @override 

  _SecondPageState createState() => new _SecondPageState(); 
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin{


  TabController controller;

  @override 
  void initState(){
    super.initState();
    controller = new TabController(length: 2, vsync: this);
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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage1()),
            );
          },
        ),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget> [
            new Tab(icon: new Icon(Icons.streetview)),
            new Tab(icon: new Icon(Icons.timer)),
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget> [
          new SecondPage1(),
          new SecondPage2(),
        ]
      ),
    );
  }
}

class SecondPage1 extends StatelessWidget {


  int answer=_main1();

   DataTable databody() {
     return DataTable(
       columns: [
         DataColumn(
           label: Text("Source",
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
          ),
         DataColumn(
           label: Text("Destination",
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
         ),
         DataColumn(
           label: Text("Distance",
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
         )
       ],
       rows: [
         DataRow(
           cells: [ 
             DataCell(Text(_source,
             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),),
             DataCell(Text(_destination,
             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
             DataCell(Text("$answer",
             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),))
            ]
          )
       ]
      );
  }


  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Container(
            child: databody()
          ),
          SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0 , 20.0 , 0.0),
            height: 40.0,
            child: Container(
              child: GestureDetector(
                onTap: _googleMaps,
                child:Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0
                    ),
                     borderRadius: BorderRadius.circular(20.0),
                     color: Colors.black.withOpacity(0.7),
                  ),

                    child: Center(
                      child: Text(
                        'Tap To see on a Map',
                        style: TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontFamily: 'Montserrat',
                        )
                      )
                    )
                  )
                  ),
                )
              ),
        ]
      ),
    );
  }
}

//This section defines the map part of the login page


void _googleMaps() {
  runApp(MyApp1());
}
class MyApp1 extends StatefulWidget {
  @override
  _MyAppState1 createState() => _MyAppState1();

}

class _MyAppState1 extends State<MyApp1> {
  GoogleMapController mapController;
  LatLng _center = const LatLng(20.5937, 78.9629);
  LatLng _markers1, _markerd;
  List<LatLng> trial = [];
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    /*for(int i=0;i<1;i++){
      _markers1 = trial[i];
    }
    for(int i=trial.length-1; i>=trial.length-1;i--){
      _markerd = trial[i];
    }*/
    //SetMapPins();
    SetPolylines();
  }

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();



 SetPolylines() async {
 
    for(int i=0;i<answer1.length;i++){
      trial.add(coordinates[answer1[i]]);
    }
  polylineCoordinates = trial;
  print(trial);

    setState(() {
      Polyline polyline = Polyline(
        polylineId: PolylineId("poly"),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates
      );

      _polylines.add(polyline);
    });

 }

// void SetMapPins() {


  /* setState(() {

      // source pin
      _markers.add(Marker(
         markerId: MarkerId("$_source"),
         position: _markers1,
      ));
      // destination pin
      _markers.add(Marker(
         markerId: MarkerId("$_destination"),
         position: _markerd
      ));
   });
}*/


  @override
  Widget build(BuildContext context) {
    var MapType;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('optimised route'),
          backgroundColor: Colors.grey[850],
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: page,
          ),
        ),
        body: GoogleMap(
         //markers: _markers,
          zoomGesturesEnabled: true,
          polylines: _polylines,
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
         initialCameraPosition: CameraPosition(
            target: _center,
           zoom: 1.0,
         ),
        ),
      ),
    );
  }
}






//below program is to find the path

//it also contains the shortest path to all the stations from a source station

    List<int> answer1 = [];

    int destination,source;
    final int NO_PARENT = -1; 
    int dijkstra3(List<List<int>> adjacencyMatrix, 
                                        int startVertex) 
    { 
      var nVertices = 16; 
      List<int> shortestDistances = new List<int>(nVertices);
      List<bool>added = new List<bool>(nVertices); 

        for (int vertexIndex = 0; vertexIndex < nVertices;  
                                            vertexIndex++) 
        { 
            shortestDistances[vertexIndex] = 9999; 
            added[vertexIndex] = false; 
        } 
          shortestDistances[startVertex] = 0; 

        List<int> parents = new List<int>(nVertices); 
        parents[startVertex] = NO_PARENT; 
        for (int i = 0; i < nVertices; i++) 
        { 
            int nearestVertex = -1; 
            int shortestDistance = 9999; 
            for (int vertexIndex = 0; 
                     vertexIndex < nVertices;  
                     vertexIndex++) 
            { 
                if (!added[vertexIndex] && 
                    shortestDistances[vertexIndex] <  
                    shortestDistance)  
                { 
                    nearestVertex = vertexIndex; 
                    shortestDistance = shortestDistances[vertexIndex]; 
                } 
            } 

            added[nearestVertex] = true;
  
            for (int vertexIndex = 0; 
                     vertexIndex < nVertices;  
                     vertexIndex++)  
            { 
                int edgeDistance = adjacencyMatrix[nearestVertex][vertexIndex]; 
                  
                if (edgeDistance > 0
                    && ((shortestDistance + edgeDistance) <  
                        shortestDistances[vertexIndex]))  
                {   
                    parents[vertexIndex] = nearestVertex; 
                    shortestDistances[vertexIndex] = shortestDistance +  
                                                       edgeDistance;                                    
                } 
            } 
        } 
  
        int temp= shortestDistances[destination];
        printPath(destination, parents);
        print(answer1);
        return temp;
        
    } 
  
    void printPath(int currentVertex, 
                                  List<int> parents) 
    { 
          
        if (currentVertex == NO_PARENT) 
        { 
            return; 
        } 
        printPath(parents[currentVertex], parents); 
        answer1.add(currentVertex);
        //for(int i=0;i<answer.length;i++){
        //  path.add(cityNames[answer[i]]);
        //}
    } 


     int _main1() 
    {
        formKey.currentState.save();
        formKey1.currentState.save();
        String source1 = _source;
        String destination1 = _destination;

        List<List<int>>adjacencyMatrix = [[0,	803,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	277,	833,	725,	9999,	9999,	9999,	9999,],
                                          [803,	0,	1110,	9999,	860,	9999,	9999,	9999,	9999,	9999,	647,	275,	9999,	9999,	9999,	251,],
                                          [9999,	1110,	0,	1030,	1020,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999],
                                          [9999,	9999,	1030,	0,	16,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	441,	9999,	9999],
                                          [9999,	860,	1020,	16,	0,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	427,	9999,	560],
                                          [9999,	9999,	9999,	9999,	9999,	0,	630,	719,	509,	9999,	773,	9999,	885,	1058,	625,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	630,	0,	9999,	765,	9999,	9999,	9999,	9999,	9999,	798,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	719,	9999,	0,	569,	1146,	1099,	9999,	9999,	9999,	9999,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	509,	765,	569,	0,	9999,	9999,	9999,	9999,	9999,	9999,	9999],
                                          [277,	9999,	9999,	9999,	9999,	9999,	9999,	1146,	9999,	0,	821,	9999,	9999,	9999,	9999,	9999],
                                          [833,	647,	9999,	9999,	9999,	773,	9999,	1099,	9999,	821,	0,	369,	332,	9999,	9999,	747],
                                          [725,	275,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	369,	0,	9999,	9999,	9999,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	885,	9999,	9999,	9999,	9999,	332,	9999,	0,	535,	9999,	674],
                                          [9999,	9999,	9999,	441,	427,	1058,	9999,	9999,	9999,	9999,	9999,	9999,	535,	0,	442,	782],
                                          [9999,	9999,	9999,	9999,	9999,	625,	798,	9999,	9999,	9999,	9999,	9999,	9999,	442,	0,	9999],
                                          [9999,	251,	9999,	9999,	560,	9999,	9999,	9999,	9999,	9999,	747,	9999,	674,	782,	9999,	0]];


        for(int i=0; i<cityNames.length; i++)
        {
          if (source1==cityNames[i]){
            source=i;
            break;
          }        
        }      
        for (int i=0; i<cityNames.length;i++){
          if(destination1==cityNames[i]){
            destination=i;
            break;
          }
        }
        int thedistance = dijkstra3(adjacencyMatrix, source);
        return thedistance; 
    } 

    int dijkstra5(int n,int v,List<List<int>> matrix, List<int> dist)
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
    min=9999;
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
  return dist[destination];
}
     int _main2() 
    {
        String source1 = _source;
        String destination1 = _destination;
        int n = 16;
        List<int> dist = new List(16);
        List<List<int>>adjacencyMatrix = [[0,	12,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	5,	15,	12,	9999,	9999,	9999,	9999],
                                          [12,	0,	23,	9999,	17,	9999,	9999,	9999,	9999,	9999,	13,	6,	9999,	9999,	9999,	5],
                                          [9999,	23,	0,	22,	22,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999],
                                          [9999,	9999,	22,	0,	1,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	8,	9999,	9999],
                                          [9999,	17,	22,	1,	0,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	6,	9999,	12],
                                          [9999,	9999,	9999,	9999,	9999,	0,	11,	12,	11,	9999,14,	9999,	16,	20,	12,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	11,	0,	9999,	13,	9999,	9999,	9999,	9999,	9999,	14,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	12,	9999,	0,	9,	19,	21,	9999,	9999,	9999,	9999,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	11,	13,	9,	0,	9999,	9999,	9999,	9999,	9999,	9999,	9999],
                                          [5,	9999,	9999,	9999,	9999,	9999,	9999,	19,	9999,	0,	15,	9999,	9999,	9999,	9999,	9999],
                                          [15,	13,	9999,	9999,	9999,	14,	9999,	21,	9999,	15,	0,	7,	7,	9999,	9999,	16],
                                          [12,	6,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	9999,	7,	0,	9999,	9999,	9999,	9999],
                                          [9999,	9999,	9999,	9999,	9999,	16,	9999,	9999,	9999,	9999,	7,	9999,	0,	12,	9999,	15],
                                          [9999,	9999,	9999,	8,	6,	20,	9999,	9999,	9999,	9999,	9999,	9999,	12,	0,	9,	17],
                                          [9999,	9999,	9999,	9999,	9999,	12,	14,	9999,	9999,	9999,	9999,	9999,	9999,	9,	0,	9999],
                                          [9999,	5,	9999,	9999,	12,	9999,	9999,	9999,	9999,	9999,	16,	9999,	15,	17,	9999,	0]];



        for(int i=0; i<cityNames.length; i++)
        {
          if (source1==cityNames[i]){
            source=i;
            break;
          }        
        }      
        for (int i=0; i<cityNames.length;i++){
          if(destination1==cityNames[i]){
            destination=i;
            break;
          }
        }
        int thetime = dijkstra5(n,source,adjacencyMatrix, dist);
        return thetime; 
    } 

///
///
///
///
///
///
///
//

void page(){

  SecondPage2;
}

class SecondPage2 extends StatelessWidget {

  String source,destination;
  SecondPage2({this.source, this.destination});
  int answer5 = _main2();

   DataTable databody() {
     return DataTable(
       columns: [
         DataColumn(
           label: Text("Source",
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
          ),
         DataColumn(
           label: Text("Destination",
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)
         ),
         DataColumn(
           label: Text("Time(in Hrs)",
           style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),)
         )
       ],
       rows: [
         DataRow(
           cells: [ 
             DataCell(Text(_source,
             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
             DataCell(Text(_destination,
             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
             DataCell(Text("$answer5",
             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),))
            ]
          )
       ]
      );
  }


  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Container(
            child: databody()
          ),
          SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0 , 20.0 , 0.0),
            height: 40.0,
            child: Container(
              child: GestureDetector(
                onTap: _googleMaps,
                child:Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0
                    ),
                     borderRadius: BorderRadius.circular(20.0),
                     color: Colors.black.withOpacity(0.7),
                  ),

                    child: Center(
                      child: Text(
                        'Tap To see on a Map',
                        style: TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontFamily: 'Montserrat',
                        )
                      )
                    )
                  )
                  ),
                )
              ),
        ]
      ),
    );
  }
}



