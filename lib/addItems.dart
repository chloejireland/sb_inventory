//TODO
// - fix add screen by adding cancel button and validation of user input

// ignore_for_file: file_names, avoid_print, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:sb_inventory/tool.dart';

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
  //late List<Tool> tools;
  late List values;
  late List<dynamic> keys;

  final database = FirebaseDatabase.instance.ref();
  DatabaseReference toolsChild = FirebaseDatabase.instance.ref("/toolID");
  late StreamSubscription _streamSubscription;

  DatabaseReference dbRef = FirebaseDatabase.instance.ref('/toolID');

  //DatabaseReference toolsChild = dbRef.child("tools");

  final TextEditingController itemCtrl = TextEditingController();
  final TextEditingController numCtrl = TextEditingController();
  final TextEditingController groupCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _activateListener();
  }

  // discard any resources used up by the object
  @override
  void dispose() {
    super.dispose();
    itemCtrl.dispose();
    numCtrl.dispose();
    groupCtrl.dispose();
  }

  List<String> toolAtts = [];

  void _activateListener() {
    dbRef.onValue.listen((DatabaseEvent event) {
      // iterate through the whole database by every key?
      final data = event.snapshot.value;

      String encodeData = jsonEncode(data);
      Map<String, dynamic> parsedData = jsonDecode(encodeData);

      dynamic values = parsedData.values;
      dynamic keys = parsedData.keys;
      print('keys $keys');
      print('values: $values');

      print('--------- PARSED DATA ---------');

      print('parsed dataruntime type');
      print(parsedData.runtimeType);
      print('parsed data: $parsedData');
      print('parsedData.length: ');
      print(parsedData.length);

      // key -itemID
      for (int idx = 0; idx < parsedData.length; idx++) {
        toolAtts.add((parsedData.keys.elementAt(idx)));
        print(parsedData.keys.elementAt(idx));
        // current stock (type cast to string)
        toolAtts.add(values.elementAt(idx)['currentStock'].toString());
        // groupname
        toolAtts.add(values.elementAt(idx)['groupName']);
        // toolName
        toolAtts.add(values.elementAt(idx)['toolName']);
        print(values.elementAt(idx)['toolName']);
      }

      //parsedData.forEach((key, values) {
      //  toolAtts.add((parsedData.keys.elementAt(idx)));
      //  print()
      //  toolAtts.add(values.elementAt(0)['currentStock'].toString());
      //});

      //toolAtts.add(parsedData.keys.first);
      // current stock (type cast to string)
      //toolAtts.add(values.elementAt(0)['currentStock'].toString());
      // groupname
      //toolAtts.add(values.elementAt(0)['groupName']);
      // toolName
      //toolAtts.add(values.elementAt(0)['toolName']);

      //print(parsedData.values.elementAt(0)['currentStock']); // current Stock?

      print('toolAtts: $toolAtts');
      print('--------------------------------');

      /*
      print('---------- UNPARSED DATA -----------------');
      print('data runtime type');
      print(data.runtimeType);
      print('data: $data');
      // print(); // current Stock?
      print('-------------------------------------------');
      */

      // TESTING SOMETHING
      // -----------------
      /*
      List testingList;
      for (MapEntry<String, dynamic> idx in parsedData.entries) {
        testingList.add(Tool.fromJson(idx));
      }
      */

      // ------------------

      //print(parsedData.keys.first);
      //print('values :  \t $values');
      //Iterable<dynamic> values = parsedData.values;

      /****

      String toolID = parsedData.keys.first; // need to change

      int curStock = parsedData.values.elementAt(0);
      //print(curStock);

      //int curStock = values.elementAt(0);
      String groupName = values.elementAt(1);
      String toolName = values.elementAt(2);
      print(curStock);
      print(toolID);
      print(groupName);
      print(toolName);

      ******/

      //values = parsedData.values;
      //keys = parsedData.keys.first;
      //Tool(this.toolID, this.groupName, this.toolName, this.currentStock);

      //Tool tool = Tool(toolID, groupName, toolName, curStock);
      //tools.add(tool);
    });
  } // end activate listenters

  void makeTool(List keys, List values, List toolsList) {
    // for the length of the 'keys' list
    for (int idx = 0; idx < keys.length; idx++) {
      //String a = keys[idx];
      //String b = values[idx]['currentStock'];
      //String c = values[idx]['groupName'];
      //String d = values[idx]['toolName'];

      //Tool tool = Tool(a, b, c, d);
      //tools.add(tool);
    }
  }

  String string(int) {
    var newStr = int.toString();
    return newStr;
  }

  @override
  Widget build(BuildContext context) {
    //initialize tools with all of the objects before calling build function
    // to avoid late inisitalization error?
    final toolsRef = database.child('/toolID');
    //_activateListener();

    // makeTool(keys, values, tools);
    // need to have the db loaded be4 making the list

    List<String> tools = ['1', '2'];
    List<bool> isChecked = List<bool>.generate(tools.length, (index) => false);

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
              itemCount: tools.length,
              itemBuilder: (context, index) {
                //final tool = tools[index];
                return Row(key: ObjectKey(tools[index]), children: [
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
                      child: Text(
                        //string(tools[index].currentStock),
                        string(toolAtts[1]),
                        style: hRowStyle,
                      )),

                  // ignore: prefer_const_constructors
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 45, 0),
                      child: Text(
                        //tools[index].toolName,
                        string(toolAtts[3]),
                        style: hRowStyle,
                      )),

                  // ignore: avoid_unnecessary_containers
                  Container(
                    // ignore: sort_child_properties_last
                    child: Text(
                      //tools[index].groupName,
                      string(toolAtts[2]),
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
                        //tools.removeAt(index);
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
                  //var ran = Random();
                  Map<String, String> tool = {
                    'toolName': itemCtrl.text,
                    'currentStock': numCtrl.text,
                    'groupName': groupCtrl.text,
                    //'neededStock' : someVar
                    //'toolID' : someID,
                  };
                  toolsChild
                      .push()
                      .set(tool)
                      .then((_) => print("success!"))
                      .catchError((onError) => print("ERROR! $onError"));
                  //toolsChild
                  //    .set({'tool': 'Jumbo Ring', 'number': 1})
                  //    .then((_) => print("success!"))
                  //    .catchError((onError) => print("ERROR! $onError"));
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
      "scan anytime to add tools",
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

  @override
  void deactivate() {
    _streamSubscription.cancel();
    super.deactivate();
  }
} //  end class

class Tool {
  String toolID = '';
  String groupName = '';
  String toolName = '';
  int currentStock = 0; // change to int?
  //int neededStock;

  // constructor
  Tool(this.toolID, this.groupName, this.toolName, this.currentStock);

  Tool.fromList(List attList) {
    toolID = attList[0];
    currentStock = attList[1];
    groupName = attList[2];
    toolName = attList[3];
  }
  /*
  Tool.fromJson(Map<String, dynamic> json)
      : groupName = json['groupName'],
        toolName = json['toolName'],
        currentStock = json['currentStock'],
        toolID = "12345";
  */
  //void tool2List(Tool tool, List<Tool> tools) {
  //  tools.add(tool);
  //}
} // end tool class

