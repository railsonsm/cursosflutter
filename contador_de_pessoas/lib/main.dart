import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contados de pessoas",
      home: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas:  0",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "pode Entrar!!",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ])));
}
