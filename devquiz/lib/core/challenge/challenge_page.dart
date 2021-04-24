import 'package:devquiz/core/challenge/widgets/question_indicator_widget.dart';
import 'package:devquiz/core/challenge/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestIndicatorWidget(),
        ),
      ),
      body: QuizWidget(
        title: "O que oo flutter faz em sua totalidade?",
      ),
    );
  }
}
