import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    Key key,
    this.perguntas,
    this.perguntaSelecionada,
    this.responser,
  }) : super(key: key);
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responser;

  bool get temPerguntaSelecionada => perguntaSelecionada < perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((t) {
          return Resposta(
              resposta: t['texto'],
              quandoSelecionado: () => responser(t['pontuacao']));
        }).toList()
      ],
    );
  }
}
