import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx/app/data/model/user_model.dart';
import 'package:getx/app/data/repository/login_respository.dart';
import 'package:getx/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();

  void register() async {
    User user = await repository.createUserWithEmailAndPassword(emailCtrl.text, passwordCtrl.text, nameCtrl.text);

    if (user != null) {
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void login() async {
    User user = await repository.signInUserWithEmailAndPassword(emailCtrl.text, passwordCtrl.text);

    if (user != null) {
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }
}
