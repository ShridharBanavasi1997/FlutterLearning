import 'package:first_project/app.screen/first_screen.dart';
import "package:flutter/material.dart";

import 'app.screen/home.dart';
import 'app.screen/list.dart';
import 'app.screen/simpleintrest.dart';
import 'app.screen/statefullexample.dart';

void main() {
  runApp(myFirstApp());
}

class myFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My first App",
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "My First App",
              textDirection: TextDirection.ltr,
            ),
          ),
          body: SimpleInterst(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => debugPrint("FAB clicked"),
        //   child: Icon(Icons.add),
        //   tooltip: "Add",
        // ),
      ),
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent
      ),
    );
  }
}

