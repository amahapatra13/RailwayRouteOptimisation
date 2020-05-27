import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage>{
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child:Align(
                    alignment: Alignment(0.00, -0.35),
                  child: Image(image: new AssetImage('assets/Indian-Railways-01.png'),
                  height: 100.0,
                  width: 100.0,
                  ),)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 80.0,fontWeight: FontWeight.bold,fontFamily: 'Baloo',
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 180.0, 0.0, 0.0),
                  child: Text(
                    'There',
                    style: TextStyle(
                      fontSize: 80.0,fontWeight: FontWeight.bold,fontFamily: 'Baloo',
                    )
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(right:20.0, top:350.0, left:20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          )
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          )
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          )
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height:40.0),
                      Container(
                        height: 40.0,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'CREATE ACCOUNT',
                                 style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            )
                          )
                        )
                      )
                    ],
                  )
                ), 
              ],
            )
          )
        ],
      )
    );
  }   
}