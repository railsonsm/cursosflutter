import 'dart:ui';

import 'package:controle_pessoal/components/transaction_form.dart';
import 'package:controle_pessoal/components/transaction_list.dart';
import 'package:controle_pessoal/components/transaction_user.dart';
import 'package:controle_pessoal/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() {
  runApp(SpensesApp());
}

class SpensesApp extends StatelessWidget {
  const SpensesApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Gráfico"),
              elevation: 3,
            ),
          ),
          TranctionUser()
        ],
      ),
    );
  }
}
