import 'package:devquiz/core/challenge/challenge_page.dart';
import 'package:devquiz/core/home/home_page.dart';
import 'package:flutter/material.dart';

import 'splash/splash_pagr.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ChallengePage(),
    );
  }
}
