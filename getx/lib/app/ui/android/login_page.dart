import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Hero(
                tag: "dash",
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48,
                  child: Image.asset("assets/audio.jpg"),
                )),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              obscureText: true,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Senha",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(12),
                color: Get.theme.primaryColor,
                child: Text(
                  "Acessar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(color: Colors.black54),
                ))
          ],
        ),
      ),
    );
  }
}
