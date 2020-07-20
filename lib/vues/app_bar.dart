import 'package:flutter/material.dart';
import 'package:linkservicesflutter/vues/default_button.dart';
import 'package:linkservicesflutter/vues/login.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.30),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            height: 25,
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5),
          Text(
            "Link'Services".toUpperCase(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          DefaultButton(
            text: "Connexion",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                  LoginPage())
              );
            },
          ),
        ],
      ),
    );
  }
}
