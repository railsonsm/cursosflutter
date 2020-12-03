import 'package:flutter/material.dart';

class TransactioForm extends StatelessWidget {
  TransactioForm({Key key, this.onSubmit}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

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
                onPressed: () {
                  final title = valueController.text;
                  final value = double.tryParse(valueController.text) ?? 0.0;
                  onSubmit(title, value);
                },
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
