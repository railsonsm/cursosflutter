import 'dart:math';
import 'dart:ui';

import 'package:controle_pessoal/components/chart.dart';
import 'package:controle_pessoal/components/transaction_form.dart';
import 'package:controle_pessoal/components/transaction_list.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Open Sans',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tenis',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta Luz',
      value: 211.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta Luz',
      value: 211.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta Luz',
      value: 211.76,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
            (tr) => tr.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        builder: (_) {
          return TransactioForm(
            onSubmit: _addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Despesas Pessoais"),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context))
      ],
    );
    final height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: height * 0.3,
                  child: Chart(recentTrasaction: _recentTransactions)),
              Container(
                height: height * 0.7,
                child: TransactionalList(
                  transactions: _transactions,
                  onRemove: _deleteTransaction,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
