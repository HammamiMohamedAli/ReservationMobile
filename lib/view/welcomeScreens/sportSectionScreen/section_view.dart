// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/main.dart';
import 'package:yallaplay_mobile/service/repositories/activity_repository.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/questionScreens/question_view.dart';

class SectionView extends ConsumerStatefulWidget {
  const SectionView({super.key});
  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends ConsumerState<SectionView> {
  final _storage = const FlutterSecureStorage();
  // final activityFutureProvider = FutureProvider.family(
  //   (ref, WidgetRef widgetRef) async =>
  //       ref.watch(activityViewModelProvider).fetchActivityInfo(widgetRef),
  // );
  @override
  Widget build(BuildContext context) {
    //await connectViewModel.signIn();
    final navigator = ref.watch(navigatorKeyProvider);
    // return
    // Consumer(builder: (context, ref, child) {
    //   final activitiesFutureProvider = ref.watch(activityFutureProvider(ref));
    return Scaffold(
      body:
          //  activitiesFutureProvider.when(
          //   data: (data) =>
          Container(
        width: double.infinity,
        height: double.infinity,
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
              Image.asset('assets/logo/logoYallaPlay.png', width: 500),
              const Text('Welcome Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
              const Text("Dali",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
              const Padding(
                padding: EdgeInsets.only(bottom: 40, top: 40),
                child: Text(
                  'choisissez votre sport :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0), 
                    child: ElevatedButton(
                      onPressed: () async {
                        final _storage = const FlutterSecureStorage();
                         await _storage.write(
                                  key: 'selected_sport', value: 'padel');
                          final selectedSport =
                              await _storage.read(key: 'selected_sport');
                          Map body = {
                            "activity": selectedSport,
                          };
                          ActivityRepos().ChooseActivity(body);
                        // ignore: use_build_context_synchronously
                       await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestionScreen(),
                          ),
                        );
                        // if (data.data.activity.ratingValue == "0.0") {
                        // navigator.currentState
                        //     ?.pushReplacementNamed('/questions');
                        // } else {
                        //   navigator.currentState
                        //       ?.pushReplacementNamed('/homePage');
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkyellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 80),
                      ),
                      child: const Text(
                        'Padel',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final _storage = const FlutterSecureStorage();
                         await _storage.write(
                                  key: 'selected_sport', value: 'tennis');
                          final selectedSport =
                              await _storage.read(key: 'selected_sport');
                          Map body = {
                            "activity": selectedSport,
                          };
                          ActivityRepos().ChooseActivity(body);
                        // if (data.data.activity.ratingValue == "0.0") {
                        // navigator.currentState
                        //     ?.pushReplacementNamed('/questions');
                        // ignore: use_build_context_synchronously
                      await  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestionScreen(),
                          ),
                        );
                        // } else {
                        //   navigator.currentState
                        //       ?.pushReplacementNamed('/homePage');
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkyellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 76),
                      ),
                      child: const Text(
                        'Tennis',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              await _storage.write(
                                  key: 'selected_sport', value: 'football');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(207, 160, 148, 108),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 86),
                            ),
                            child: const Text(
                              'Foot',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 137, 129, 100),
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 170,
                          top: 15,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(45 / 360),
                            child: Container(
                              height: 10,
                              width: 60,
                              color: Color.fromARGB(255, 229, 190, 72),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Coming soon',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 6.5,
                                        fontFamily: 'Poppins-SemiBold',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child:
                    Image.asset('assets/icons/menu.png', width: 50, height: 50),
              ),
            ],
          ),
        ),
      ),
      // error: (Object error, StackTrace stackTrace) {},
      // loading: () {},
    );
  }
}
