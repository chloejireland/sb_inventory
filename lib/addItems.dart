// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AddItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddItemsPage();
  }
}

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({super.key});

  @override
  _AddItemsPageState createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  static final List<String> items = <String>["Item 1", "Item 2", "Item 3"];

  final database = FirebaseDatabase.instance.ref();

  final TextEditingController itemCtrl = TextEditingController();
  final TextEditingController numCtrl = TextEditingController();
  final TextEditingController groupCtrl = TextEditingController();

  List<bool> isChecked = List<bool>.generate(items.length, (index) => false);

  // discard any resources used up by the object
  @override
  void dispose() {
    itemCtrl.dispose();
    numCtrl.dispose();
    groupCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toolsRef = database.child('/tools');

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
                final item = items[index];
                return Row(key: ObjectKey(item), children: [
                  Checkbox(
                    value: isChecked[index],
                    onChanged: (value) {
                      setState(() {
                        isChecked[index] = value!;
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
                        "Jumbo Wax Ring",
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                    child: IconButton(
                      icon: const Icon(Icons.clear_rounded),
                      iconSize: 25,
                      onPressed: () {
                        //items.removeAt(index);
                      },
                    ),
                  ),
                ]);
              }, // item builder
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
                thickness: 1,
                color: Colors.black,
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
              endIndent: 5,
              indent: 5,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(45, 10, 45, 45),
                child: IconButton(
                  icon: const Icon(Icons.add_box_rounded),
                  iconSize: 45,
                  color: const Color.fromARGB(243, 220, 103, 7),
                  onPressed: () {
                    _addItemButton(context);
                  },
                ))
          ], // children
        ),
      ),
    );
  } // build

  /* database setting code - WORKS
   
   onPressed: () async {
                    toolsRef
                        .set({'tool': 'Jumbo Wax Ring', 'number': 3})
                        .then((_) => print("success!"))
                        .catchError((onError) => print("ERROR! $onError"));
             },

  */

  Future<void> _addItemButton(BuildContext context) async {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('add an item'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                  controller: itemCtrl,
                  decoration: const InputDecoration(
                    hintText: "item name",
                  )),
              TextFormField(
                  controller: numCtrl,
                  decoration: const InputDecoration(
                    hintText: "# needed",
                  )),
              TextFormField(
                  controller: groupCtrl,
                  decoration: const InputDecoration(
                    hintText: "group name",
                  )),
            ],
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        //backgroundColor: const Color.fromARGB(243, 220, 103, 7),
                        //color: Colors.white,
                        )),
                child: const Text("done!"),
                onPressed: () {
                  Navigator.of(context).pop();
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => itemCtrl.clear());
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => groupCtrl.clear());
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => numCtrl.clear());
                })
          ],
        );
      }),
    );
  }
  /*
  TextField(
            controller: myController,
          ),
  */

  final pageCol = Column(
    children: [
      restockTxt,
      scanTxt,
      divLine,
      headRow,
      const Divider(
        thickness: 1,
        color: Colors.black,
        endIndent: 5,
        indent: 5,
      )
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
    height: 15,
    endIndent: 30,
    indent: 30,
    thickness: 1,
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
        padding: EdgeInsets.fromLTRB(40, 12, 2, 0),
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
