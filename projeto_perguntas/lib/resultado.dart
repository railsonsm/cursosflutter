import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Resultado extends StatelessWidget {
  const Resultado({Key key, this.pontuacao, this.reiniciar}) : super(key: key);
  final int pontuacao;
  final void Function() reiniciar;

  String get frase {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          frase,
          style: TextStyle(fontSize: 28),
        )),
        TextButton(
          onPressed: reiniciar,
          child: Text('Reiniciar?'),
          style: TextButton.styleFrom(primary: Colors.red),
        )
      ],
    );
  }
}
