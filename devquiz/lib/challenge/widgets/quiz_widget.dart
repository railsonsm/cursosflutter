import 'package:devquiz/challenge/widgets/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "data",
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            Awnser(
                title:
                    "O que oo flutter faz em sua totalidade?   dsds dsd sds d sd"),
            Awnser(
                title:
                    "O que oo flutter faz em sua totalidade?   dsds dsd sds d sd"),
            Awnser(
                title:
                    "O que oo flutter faz em sua totalidade?   dsds dsd sds d sd")
          ],
        ),
      ),
    );
  }
}
