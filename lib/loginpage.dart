import 'package:all_about_flutter/constants.dart';
import 'package:all_about_flutter/drawer.dart';
import 'package:all_about_flutter/listview.dart';
import 'package:all_about_flutter/listviewfb.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginpage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/bgimg.jpg",
            fit: BoxFit.fill,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Enter Username",
                                labelText: "Username"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password"),
                          ),
                          SizedBox(height: 30),
                          RaisedButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Listview()));
                              Constants.pref.setBool("loggedin", true);
                              Navigator.pushReplacementNamed(
                                  context, Listviewfb.routeName);
                            },
                            color: Colors.yellow[300],
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
