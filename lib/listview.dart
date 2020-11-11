import 'dart:convert';

import 'package:all_about_flutter/constants.dart';
import 'package:all_about_flutter/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listview extends StatefulWidget {
  static const String routeName = "/listview";
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  var data;
  var url = "https://jsonplaceholder.typicode.com/photos";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
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
      body: data != null
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index]["thumbnailUrl"]),
                  ),
                  title: Text(data[index]["title"]),
                  subtitle: Text("ID: ${data[index]["id"]}"),
                );
              },
            )
          : CircularProgressIndicator(),
    );
  }
}
