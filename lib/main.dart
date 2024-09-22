// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallaplay_mobile/view/AuthScreens/connectScreen/connect_view.dart';
import 'package:yallaplay_mobile/view/AuthScreens/signInScreen/signIn_view.dart';
import 'package:yallaplay_mobile/view/AuthScreens/signUpScreen/signUp_view.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/homePageScreen/homePageView.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/questionScreens/question_view.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/sportSectionScreen/section_view.dart';
import 'package:yallaplay_mobile/widget/onboarding_wrapper.dart';

final navigatorKeyProvider = Provider.autoDispose<GlobalKey<NavigatorState>>(
  (ref) => ref.read(navigatorKeyOverrideProvider),
);

final navigatorKeyOverrideProvider =
    Provider.autoDispose<GlobalKey<NavigatorState>>(
  (ref) => GlobalKey<NavigatorState>(),
);
final onboardingShownProvider = FutureProvider<bool>((ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('onboardingShown') ?? false;
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        navigatorKeyProvider,
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingShown = ref.watch(onboardingShownProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yalla Play',
      theme: ThemeData(fontFamily: 'Poppins'),
      navigatorKey: ref.read(navigatorKeyProvider),
      initialRoute: '/',
      builder: (BuildContext context, Widget? child) {
        return EasyLoading.init()(context, child);
      },
      routes: {
        '/': (context) {
          if (onboardingShown.isLoading == true) {
            // Onboarding already shown, navigate to the next screen
            return const ConnectView();
          } else {
            // Onboarding not shown, display the onboarding screen
            return OnboardingWrapper();
          }
        },
        // '/': (context) => OnboardingView(onboardingItems: onboardingItems),
        '/connect': (context) => const ConnectView(),
        '/signIn': (context) => SignInView(),
        '/signUp': (context) => SignUpView(),
        '/section': (context) => const SectionView(),
        '/questions': (context) => const QuestionScreen(),
        '/homePage': (context) => const HomePageScreen(),
      },
    );
  }
}
