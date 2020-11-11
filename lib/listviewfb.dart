import 'dart:convert';

import 'package:all_about_flutter/constants.dart';
import 'package:all_about_flutter/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listviewfb extends StatefulWidget {
  static const String routeName = "/listviewfb";
  @override
  _ListviewfbState createState() => _ListviewfbState();
}

class _ListviewfbState extends State<Listviewfb> {
  var data;
  var url = "https://jsonplaceholder.typicode.com/photos";

  Future getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ListView"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.pref.setBool("loggedin", false);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              })
        ]),
        body: FutureBuilder(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text("Connection lost"));
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text("Some Error accured!"));
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]["title"]),
                      subtitle: Text("ID: ${snapshot.data[index]["id"]}"),
                      leading: Image.network(snapshot.data[index]["url"]),
                    );
                  },
                );
            }
          },
          future: getData(),
        ));
  }
}
