import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() quandoSelecionado;

  const Resposta({Key key, this.resposta, this.quandoSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text(resposta),
            onPressed: quandoSelecionado));
  }
}
