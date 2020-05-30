import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/signup.dart';
import 'package:project/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
void main() => runApp(new MyApp());

  String email='';
  String password='';

  final formKey2= GlobalKey<FormState>();



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup' : (BuildContext context) => new SignupPage(),
        '/login' : (BuildContext context) => new LoginPage1()
      },
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _railwaylogoanimator;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _railwaylogoanimator = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _animation = new CurvedAnimation(
        parent: _railwaylogoanimator, curve: Curves.bounceOut);
    _animation.addListener(() => this.setState(() {}));
    _railwaylogoanimator.forward();
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/project1.jpg'),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/Indian-Railways-01.png'),
                height: 120.0,
                width: 120.0,
              ),
              new Form(
                key: formKey2,
                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    child: new Column
                    (crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      new TextFormField(
                        onSaved: (input) => email = input,
                        decoration: new InputDecoration(
                            labelText: 'Enter the username or email',
                            labelStyle: TextStyle(color: Colors.white.withOpacity(1.0),fontFamily: 'Baloo',fontSize: 20.0),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),
                            ),),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                        onSaved: (input) => password = input,
                        decoration: new InputDecoration(
                            labelText: 'Enter the Password',
                            labelStyle: TextStyle(color: Colors.white.withOpacity(1.0),fontFamily: 'Baloo',fontSize: 20.0,),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45)
                            )
                            ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                    )]),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0 , 20.0 , 0.0),
                height: 40.0,
                child: Container(
                  child: GestureDetector(
                    onTap:signIn,
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
                        'LOGIN',
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
              SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0 , 20.0 , 0.0),
                height: 40.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0
                    ),
                     borderRadius: BorderRadius.circular(20.0),
                     color: Colors.black.withOpacity(0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontFamily: 'Montserrat',
                        )
                      )
                    )
                  ),
                )
              ),
            ],
          )
        ],
      ),
    );
  }
  Future<void> signIn() async {
  formKey2.currentState.save();
  try{
  FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
  //Navigator.push(context, route)
  }catch(e){
    print(e.message);
  }
  }


}



