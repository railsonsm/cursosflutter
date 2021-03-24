import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactioForm extends StatefulWidget {
  TransactioForm({Key key, this.onSubmit}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  _TransactioFormState createState() => _TransactioFormState();
}

class _TransactioFormState extends State<TransactioForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectdDate = DateTime.now();

  _submitForm() {
    final title = _valueController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    widget.onSubmit(title, value, _selectdDate);
  }

  _showDatePicker() => {
        showDatePicker(
          initialEntryMode: DatePickerEntryMode.calendar,
          useRootNavigator: false,
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2019),
          lastDate: DateTime.now(),
        ).then((value) {
          setState(() {
            _selectdDate = value;
          });
        })
      };

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
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectdDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Data selecionada ${DateFormat('d/M/y').format(_selectdDate)}'),
                    FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        onPressed: _showDatePicker,
                        child: Text(
                          'Selecionar data',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: _submitForm,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text("Nova   transação"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
