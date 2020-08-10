import 'package:flutter/material.dart';
import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () {},
          ),
        ],
      ),
      appBar: AppBar(
        leading: Icon(Icons.adb),
        title: Text(
          "Flutter BloC Demo",
          style: TextStyle(
            fontFamily: "poppins",
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink],
            ),
          ),
        ),
      ),
      body: Center(
        child: AnimatedContainer(
          width: 100,
          height: 100,
          color: Colors.pink,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
