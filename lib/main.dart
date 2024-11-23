import 'package:flutter/material.dart';
import 'package:sinkronisasilokal/homepage.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Sinkronisasi ',
      home: UserScreen(),
    );
  }
}