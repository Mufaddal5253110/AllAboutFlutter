import 'package:all_about_flutter/drawer.dart';
import 'package:all_about_flutter/listview.dart';
import 'package:all_about_flutter/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "AllAboutFlutter",
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: LoginPage(),
    routes: {
      LoginPage.routeName: (context) => LoginPage(),
      Listview.routeName: (context) => Listview(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Drawer")),
        drawer: DrawerPage(),
      ),
    );
  }
}
