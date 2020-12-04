import 'package:flutter/material.dart';

class TransactioForm extends StatefulWidget {
  TransactioForm({Key key, this.onSubmit}) : super(key: key);

  final void Function(String, double) onSubmit;

  @override
  _TransactioFormState createState() => _TransactioFormState();
}

class _TransactioFormState extends State<TransactioForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = valueController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    widget.onSubmit(title, value);
  }

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
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              FlatButton(
                onPressed: _submitForm,
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
