import 'package:flutter/material.dart';
import 'package:fluttersql/asset/ui/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tambahkan Daftar',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Home()
    );
  }
}