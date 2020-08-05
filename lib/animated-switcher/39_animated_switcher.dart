import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isON = false;

  Widget myWidget = Container(
    width: 200,
    height: 200,
    child: Center(
        child: Text(
      "Switch OFF",
      style: TextStyle(
        fontFamily: "poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    )),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [Colors.red, Colors.amber])),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Animated Switcher",
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
              AnimatedSwitcher(
                child: myWidget,
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
              ),
              Switch(
                  activeColor: Colors.pink,
                  value: isON,
                  onChanged: (newValue) {
                    isON = newValue;
                    setState(() {
                      if (isON) {
                        myWidget = Container(
                          key: ValueKey(1),
                          width: 200,
                          height: 200,
                          child: Center(
                              child: Text(
                            "Switch ON",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.indigo])),
                        );
                      } else {
                        myWidget = Container(
                          key: ValueKey(0),
                          width: 200,
                          height: 200,
                          child: Center(
                              child: Text(
                            "Switch OFF",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.amber])),
                        );
                      }
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
