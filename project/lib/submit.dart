import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SubmitPage(),
    );
  }
}
class SubmitPage extends StatefulWidget{
 @override
 _SubmitPage createState() => new _SubmitPage();
}


class _SubmitPage extends State<SubmitPage>{
@override 
Widget build(BuildContext context){
  return new Scaffold(

  );
}
}
