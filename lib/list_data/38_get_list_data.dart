import 'package:flutter/material.dart';
import '38_user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
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
                gradient: LinearGradient(colors: [Colors.pink, Colors.purple])),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(child: Text(output)),
              RaisedButton(
                onPressed: () {
                  User.getUser("1").then((users) {
                    output = "";
                    for (int i = 0; i < users.length; i++)
                      output = output + "[" + users[i].name + "]";
                    setState(() {});
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text("GET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
