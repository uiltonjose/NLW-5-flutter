import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int countQuestions;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.countQuestions,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.trophy),
          Column(
            children: [
              Text(
                'Parabéns!',
                style: AppTextStyles.heading40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: Text.rich(
                  TextSpan(
                      text: 'Você concluiu',
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                          text: ' $title',
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text: ' com $result de $countQuestions acertos.',
                          style: AppTextStyles.body,
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWdiget.purple(
                        label: 'Compartilhar',
                        onTap: () {
                          Share.share(
                              'DevQuiz NLW5 - Flutter: Resultado do Quiz: $title\nObtive: ${(result / countQuestions) * 100}% em aproveitamento!');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: NextButtonWdiget.transparent(
                      label: 'Voltar ao início',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
