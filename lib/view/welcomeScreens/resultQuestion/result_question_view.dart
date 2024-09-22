import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/homePageScreen/homePageView.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/resultQuestion/result_question_view_model.dart';

class ResultQuestionScreen extends ConsumerStatefulWidget {
  const ResultQuestionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResultQuestionScreenState createState() => _ResultQuestionScreenState();
}

final activityFutureProvider = FutureProvider.family(
  (ref, WidgetRef widgetRef) async =>
      ref.watch(activityViewModelProvider).fetchActivityInfo(widgetRef),
);

class _ResultQuestionScreenState extends ConsumerState<ResultQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final activitiesFutureProvider = ref.watch(activityFutureProvider(ref));
      return Scaffold(
        body: activitiesFutureProvider.when(
          data: (data) => Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/background/background4.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/logo/logoYallaPlay.png',
                      width: 118.4,
                      height: 86.8,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Vous êtes prêt à jouer \n         maintenant !",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ClipOval(
                    child: Image.network(
                      data!.data.avatar,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/default_avatar.png',
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Votre niveau est :',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                  data.data.activity.ratingValue.toString().substring(0,3),
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'BRAVO! Vous avez un badge',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.data.activity.rating,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 60),
                      ),
                      child: const Text(
                        'Suivant',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          ),
        ),
      );
    });
  }

}
