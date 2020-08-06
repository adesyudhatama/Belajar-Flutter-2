import 'package:belajar2/provider_state_management/42_application_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Provider State Management",
                style: TextStyle(
                  fontFamily: "poppins",
                  color: applicationColor.color,
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    duration: Duration(seconds: 1),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(margin: EdgeInsets.all(5), child: Text("B")),
                    Consumer<ApplicationColor>(
                        builder: (context, applicationColor, _) => Switch(
                            value: applicationColor.isLightBlue,
                            onChanged: (newValue) {
                              applicationColor.isLightBlue = newValue;
                            })),
                    Container(margin: EdgeInsets.all(5), child: Text("G")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
