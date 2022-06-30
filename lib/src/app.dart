import 'package:flutter/material.dart';
import 'screen/home.dart';

class PokeApp extends StatelessWidget {
  const PokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "Poke App",
      home: const Home(),
    );
  }
}
