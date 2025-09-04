import "package:flutter/material.dart";
import 'gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Razan`s First VScode Flutter app",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 209, 213, 190),
          elevation: 3,
          title: Text(
            "LUCKY DICE",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ContainerClass([
          Color.fromARGB(255, 192, 199, 158),
          Color.fromARGB(255, 208, 214, 178),
          Color.fromARGB(255, 237, 242, 214),
        ]),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
