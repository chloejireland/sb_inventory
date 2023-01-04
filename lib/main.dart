// to do
// import font packages and change fonts

import 'package:flutter/material.dart';
import 'package:sb_inventory/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      alignment: Alignment.center,
      // app background
      decoration: const BoxDecoration(color: Colors.white),
      // padding at the top of the screen
      padding: const EdgeInsets.only(top: 50),
      child: Column(children: [
        imgAndH1,
        lowerButtons,
      ]),
    )));
  } // build

} // class MyApp

// text for 'SREAMLINE INVENTORY'
const textStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Viga',
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

// log in and register button text style
const buttonStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Viga',
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

// container for logo img and title
final imgAndH1 = Container(
  child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 157)),
        Image.asset(
          'images/logo.png',
          width: 210,
          height: 326,
          fit: BoxFit.fill,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "STREAMLINE",
            style: textStyle,
          ),
        ),
        const Text(
          "INVENTORY",
          style: textStyle,
        )
      ]),
);

// container holding bottom two buttons
final lowerButtons = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Builder(builder: (BuildContext context) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                //backgroundColor: Colors.green,
                side: const BorderSide(color: Colors.black, width: 2),
                fixedSize: const Size(167, 57),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: const Text("LOG IN", style: buttonStyle),
            ));
      }),
      /*
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              //backgroundColor: Colors.green,
              side: const BorderSide(color: Colors.black, width: 2),
              fixedSize: const Size(167, 57),
            ),
            onPressed: () {},
            child: const Text("LOG IN", style: buttonStyle),
          )),
          */
      Padding(
        padding: const EdgeInsets.fromLTRB(0.5, 200, 0, 0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(192, 225, 244, 1),
            side: const BorderSide(color: Colors.black, width: 2),
            fixedSize: const Size(175, 57),
          ),
          onPressed: () {},
          child: const Text("REGISTER", style: buttonStyle),
        ),
      ),
    ], //children
  ),
);

/*
    Builder(
      builder: (BuildContext context) {
        return Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  //backgroundColor: Colors.green,
                  side: const BorderSide(color: Colors.black, width: 2),
                  fixedSize: const Size(167, 57),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                }, // onPressed
                child: const Text("LOG IN", style: buttonStyle),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.5, 200, 0, 0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(192, 225, 244, 1),
                side: const BorderSide(color: Colors.black, width: 2),
                fixedSize: const Size(175, 57),
              ),
              onPressed: () {},
              child: const Text("REGISTER", style: buttonStyle),
            ),
          )
        ]);
      },
    ),
  ], // children
));
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        /* child: Column(children: [
        Image.asset(
          'images/logo.png',
          width: 600,
          height: 600,
        ),
        const Text("Streamline Inventory"),
      ]),
    );
    */
        );
  } // build

} // class
