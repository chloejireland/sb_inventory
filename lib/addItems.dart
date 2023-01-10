// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => AddItemsState();
}

class AddItemsState extends State<AddItems> {
  bool checkBoxVal = false;
  final List<String> items = <String>["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            pageCol,
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  Checkbox(
                    value: checkBoxVal,
                    onChanged: (bool? value) {
                      setState(() {
                        checkBoxVal = value!;
                      });
                    },
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "2",
                        style: hRowStyle,
                      )),

                  // ignore: prefer_const_constructors
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 45, 0),
                      child: const Text(
                        "Jumbo Ring",
                        style: hRowStyle,
                      )),

                  // ignore: avoid_unnecessary_containers
                  Container(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Vamac",
                      style: hRowStyle,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      //change to exact color
                      color: Color.fromARGB(243, 220, 103, 7),
                    ),
                    padding: EdgeInsets.all(5),
                  ),
                ]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
                thickness: 1,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  } // build

  final pageCol = Column(
    children: [
      restockTxt,
      scanTxt,
      divLine,
      headRow,
    ],
  ); // end pageCol

// ***** begin RESTOCK ********
  static const restockTxt = Padding(
    padding: EdgeInsets.only(top: 25),
    child: Text(
      "RESTOCK",
      style: restockStyle,
    ),
  );

  static const restockStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Viga',
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 3,
  ); // end style

// ****** end RESTOCK ******

// **** begin scanTxt ****
  static const scanTxt = Padding(
    padding: EdgeInsets.only(top: 5),
    child: Text(
      "scan anytime to add items",
      style: scanStyle,
    ),
  );

  static const scanStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Viga',
    fontSize: 15,
    fontStyle: FontStyle.italic,
    letterSpacing: 3,
  ); // end style
// **** end scanTxt ****

// **** begin divider ****
  static const divLine = Divider(
    height: 20,
    endIndent: 30,
    indent: 30,
    thickness: 2,
    color: Colors.black,
  );
// **** end Divider ****

// **** begin header row *****
  static final headRow = Row(
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      // got it
      const Padding(
        padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
        child: Text(
          "Got It",
          style: hRowStyle,
        ),
      ),
      // #
      const Padding(
        padding: EdgeInsets.fromLTRB(15, 12, 2, 0),
        child: Text(
          "#",
          style: hRowStyle,
        ),
      ),
      // item
      const Padding(
        padding: EdgeInsets.fromLTRB(25, 12, 2, 0),
        child: Text(
          "Item",
          style: hRowStyle,
        ),
      ),
      // group
      const Padding(
        padding: EdgeInsets.fromLTRB(135, 12, 10, 0),
        child: Text(
          "Group",
          style: hRowStyle,
        ),
      ),
      // cancel
      const Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 2, 0),
        child: Text(
          "Cancel",
          style: hRowStyle,
        ),
      ),
    ],
  );

  static const hRowStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Inter',
    fontSize: 15,
    //fontStyle: FontStyle.italic,
    //letterSpacing: 3,
  );
// **** end header row *****

// **** begin ListView ******

} //  end class