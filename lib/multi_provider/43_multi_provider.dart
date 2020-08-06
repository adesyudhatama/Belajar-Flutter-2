import 'package:belajar2/multi_provider/43_cart.dart';
import 'package:belajar2/multi_provider/43_money.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(create: (context) => Money()),
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Cart>(
            builder: (context, cart, _) => Consumer<Money>(
              builder: (context, money, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 500) {
                    cart.quantity += 1;
                    money.balance -= 500;
                  }
                },
                child: Icon(
                  Icons.add_shopping_cart,
                ),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              "Multi Provider",
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Balance :",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins",
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      height: 45,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white10,
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )),
                    ),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Apple (500) x " + cart.quantity.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            (500 * cart.quantity).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 45,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12,
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
