import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<Question> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = (pageController.page?.toInt() ?? 1) + 1;
    });
  }

  void callNextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 10), curve: Curves.linear);
  }

  void onSelected(bool isAnswerCorrect) {
    if (isAnswerCorrect) {
      controller.countCorrectAnswers++;
    }
    callNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  pageCount: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map((question) => QuizWidgets(
                  question: question,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (value <= widget.questions.length)
                  Expanded(
                      child: NextButtonWdiget.white(
                    label: 'Pular',
                    onTap: callNextPage,
                  )),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWdiget.green(
                      label: 'Confirmar',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    title: widget.title,
                                    countQuestions: widget.questions.length,
                                    result: controller.countCorrectAnswers,
                                  )),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
