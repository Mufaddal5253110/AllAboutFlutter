import 'package:all_about_flutter/constants.dart';
import 'package:all_about_flutter/drawer.dart';
import 'package:all_about_flutter/listview.dart';
import 'package:all_about_flutter/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.pref = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "AllAboutFlutter",
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: Constants.pref.getBool("loggedin") == true ? Listview() : LoginPage(),
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
