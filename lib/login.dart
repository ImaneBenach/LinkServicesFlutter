import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:linkservicesflutter/category/utilisateurs.dart';
String baseURL="http://localhost:4000/connection";


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }
  /*
  
  Map auth;
  Future<http.Response> loginUser(String email,String password) async{

    email.trim();
    password.trim();
    
    var response = await http.post(baseURL,body: User(email: email,password: password).toLogin());
    debugPrint('Response : '+response.body);
    return response;
  }

  */


  Future<String> loginWithEmailAndPassword(String email, String password) async {
  
  
    Map <String, String> dat = {
      'email': email,
      'password': password,
    };
    
    String body = json.encode(dat);

    Map data = {
      'table': "user",
      "values": body
    };

    print(data) ;
    
    /*
    final res = await http.post('http://10.0.2.2:4000/connection',
      headers: { HttpHeaders.contentTypeHeader: "application/json"},
      body: data
    );
    */

    var uri = Uri.http('localhost:4000', '/connection/user}');
   // var res = await http.post(uri, headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    final res = await http.post(uri, headers: {HttpHeaders.contentTypeHeader: 'application/json'}, body: body);

    if (res.statusCode == 201) {
    print("200") ;
    return res.body;
    }

    
    return null;
  }


  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: FlatButton(
      onPressed : () {
        //loginWithEmailAndPassword(emailController.text, passwordController.text);
        
          Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                  Utilisateurs())
              );
              
        
        },
        
        color: Colors.black26,
        child: Text("Se connecter", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),

      ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Votre email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Votre mot de passe",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Link Services",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
}