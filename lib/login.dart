import 'package:flutter/material.dart';
import 'package:sb_inventory/addItems.dart';

//void main() {
//  runApp(const Login());
//}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            logInCol,
          ],
        ),
      ),
    );
  } // build

} // class

final logInCol = Column(
    // ignore: prefer_const_literals_to_create_immutables
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Back button
      // ignore: prefer_const_constructors
      Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 75, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 25,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      }),
      // log in text
      const Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Text(
          "Log in",
          style: logInStyle,
        ),
      ),
      // user box
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: TextFormField(
            decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'username',
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        )),
      ),
      // password box
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: TextFormField(
            decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'password',
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        )),
      ),
      // log in button
      Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(192, 225, 244, 1),
              side: const BorderSide(color: Colors.black, width: 2),
              fixedSize: const Size(379, 52),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddItems(),
                  ));
            },
            child: const Text(
              'LOG IN',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Viga',
                fontSize: 13,
              ),
            ),
          ),
        );
      })
      // keyboard
    ]);

const logInStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Comfortaa',
  fontSize: 40,
  //fontWeight: FontWeight.bold,
);
