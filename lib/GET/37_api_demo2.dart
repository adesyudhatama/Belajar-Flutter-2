import 'package:belajar2/GET/37_user_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: avoid_init_to_null
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "API Demo",
            style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.blue])),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text((user != null)
                  ? user.id + " | " + user.name + " | "
                  : "Tidak Ada Data"),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  User.connetToAPI("2").then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                color: Colors.cyan,
                child: Text(
                  "GET",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "poppins",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
