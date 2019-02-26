import 'package:flutter/material.dart';
import 'package:ordinarioflutter/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Search',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Home());
  }
}