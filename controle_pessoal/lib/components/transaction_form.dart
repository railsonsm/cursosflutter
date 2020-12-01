import 'package:flutter/material.dart';

class TransactioForm extends StatelessWidget {
  TransactioForm({Key key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: valueController,
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              FlatButton(
                onPressed: () {},
                textColor: Colors.purple,
                child: Text("Nova   transação"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
