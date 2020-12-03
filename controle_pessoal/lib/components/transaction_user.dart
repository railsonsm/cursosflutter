import 'dart:math';

import 'package:controle_pessoal/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TranctionUser extends StatefulWidget {
  TranctionUser({Key key}) : super(key: key);

  @override
  _TranctionUserState createState() => _TranctionUserState();
}

class _TranctionUserState extends State<TranctionUser> {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Novo Tenis', value: 310.76, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta Luz', value: 211.76, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactioForm(
          onSubmit: _addTransaction,
        ),
        TransactionalList(
          transactions: _transactions,
        )
      ],
    );
  }
}
