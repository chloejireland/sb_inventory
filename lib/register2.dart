// to do
// - add terms and conditions link

import 'package:flutter/material.dart';

void main() {
  runApp(const Register2());
}

class Register2 extends StatelessWidget {
  const Register2({super.key});

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
          "Register",
          style: logInStyle,
        ),
      ),
      // user box
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: TextFormField(
            decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'email',
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        )),
      ),

      // log in button
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(192, 225, 244, 1),
            side: const BorderSide(color: Colors.black, width: 2),
            fixedSize: const Size(379, 52),
          ),
          onPressed: () {},
          child: const Text(
            'SIGN UP',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Viga',
              fontSize: 13,
            ),
          ),
        ),
      ),
      // terms and conditions blurb
      const Padding(
        padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
        child: Text(
          "By signing up, you agree to Chloe's Terms of Service and Privacy Policy.",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Viga',
            fontSize: 13,
          ),
        ),
      )

      // keyboard
    ]);

const logInStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Comfortaa',
  fontSize: 40,
  //fontWeight: FontWeight.bold,
);
