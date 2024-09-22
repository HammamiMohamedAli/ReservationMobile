import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/service/repositories/answer_repos.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/questionScreens/question_view_model.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/resultQuestion/result_question_view.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

final questionViewFutureProvider = FutureProvider.family(
  (ref, WidgetRef widgetRef) async =>
      ref.watch(questionsViewModelProvider).fetchQuestion(widgetRef),
);

final List<int> _myAnswers = [];
final answerViewFutureProvider = FutureProvider.family(
  (ref, WidgetRef widgetRef) async =>
      ref.watch(answersViewModelProvider).sendAnswers(widgetRef, _myAnswers),
);

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  Map<int, int?> isSelectedMap = {};
  int? _selectedAnswerIndex;
  final Map _body = {
    "answers": _myAnswers,
  };
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final questionProvider = ref.watch(questionsViewModelProvider);
      final questionFutureProvider = ref.watch(questionViewFutureProvider(ref));
      // final answersFutureProvider = ref.watch(answerViewFutureProvider(ref));
      return Scaffold(
        body: questionFutureProvider.when(
          data: (data) => SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/background/background4.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/logo/logoYallaPlay.png',
                      width: 92.64,
                      height: 67.91,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Veuillez répondez a ces \nquestions :",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      _selectedAnswerIndex = isSelectedMap.containsKey(index)
                          ? isSelectedMap[index]!
                          : null;
                      return ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].content.capitalize(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Regular',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            if (data[index].answers.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: data[index]
                                    .answers
                                    .map(
                                      (answer) => Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: _selectedAnswerIndex ==
                                                      answer.id
                                                  ? AppColors.yellow
                                                  : const Color.fromARGB(
                                                      255, 216, 215, 215),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          color:
                                              _selectedAnswerIndex == answer.id
                                                  ? const Color.fromARGB(
                                                      255, 249, 240, 215)
                                                  : Colors.grey[100],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: RadioListTile<int>(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    bottom: 15),
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                              (states) =>
                                                  _selectedAnswerIndex ==
                                                          answer.id
                                                      ? AppColors.yellow
                                                      : AppColors.lightgrey3,
                                            ),
                                            activeColor: AppColors.yellow,
                                            hoverColor: AppColors.lightgrey2,
                                            title: Text(
                                              answer.content.capitalize(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins-Regular',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                            value: answer.id,
                                            groupValue: _selectedAnswerIndex,
                                            onChanged: (value) {
                                              questionProvider
                                                  .setSelectedAnswer(
                                                      value!, data[index].id);
                                              setState(() {
                                                isSelectedMap[index] = value ==
                                                        _selectedAnswerIndex
                                                    ? null
                                                    : value;
                                                _myAnswers.add(value);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          AnswerRepos().SendAnswers(_body);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ResultQuestionScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                        ),
                        child: const Text(
                          'Continuer',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) {},
          loading: () {}
        ),
      );
    });
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
