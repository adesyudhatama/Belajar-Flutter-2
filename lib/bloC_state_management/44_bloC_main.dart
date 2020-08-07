import 'package:belajar2/bloC_state_management/44_color_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_purple);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.pink,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_pink);
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            "BloC Without Library",
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
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              width: 100,
              height: 100,
              color: snapshot.data,
              duration: Duration(milliseconds: 500),
            );
          },
        )),
      ),
    );
  }
}
