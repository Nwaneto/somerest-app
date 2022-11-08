import 'package:flutter/material.dart';

import 'home_page.dart';
// ignore: unused_import
import 'menu_drawer.dart';
// ignore: unused_import
import 'responsive.dart';
// ignore: unused_import
import 'top_bar_contents.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Somerest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

