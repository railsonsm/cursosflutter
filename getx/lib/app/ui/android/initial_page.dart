import 'package:flutter/material.dart';
import 'package:getx/app/routes/app_routes.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [Colors.green[300], Colors.green[600]]),
          navigateAfterSeconds: Routes.LOGIN,
          loaderColor: Colors.transparent,
        ),
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/splash.png"), fit: BoxFit.contain)),
        )
      ],
    ));
  }
}
