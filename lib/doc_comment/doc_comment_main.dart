import 'package:flutter/material.dart';
import 'doc_comment_user_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final UserProfile profile = UserProfile();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.adb),
          title: Text(
            "Doc Comment",
            style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.indigo],
              ),
            ),
          ),
        ),
        body: Center(
          child: profile,
        ),
      ),
    );
  }
}
