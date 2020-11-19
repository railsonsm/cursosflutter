import 'package:controle_pessoal/models/transaction.dart';
import 'package:flutter/material.dart';

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
  final _transactions = [
    Transaction(
        id: 't1', title: 'Novo Tenis', value: 310.76, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta Luz', value: 211.76, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Gráfico"),
              elevation: 3,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    child: Text(tr.value.toString()),
                  ),
                  Column(
                    children: [
                      Text(tr.title),
                      Text(tr.date.toString()),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
