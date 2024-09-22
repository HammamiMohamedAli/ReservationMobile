// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/main.dart';
import 'package:yallaplay_mobile/model/Onboarding.dart';
import 'package:yallaplay_mobile/view/onboardingScreen/onboardig_view_model.dart';

class OnboardingView extends ConsumerWidget {
  final List<OnboardingItem> onboardingItems;

  OnboardingView({super.key, required this.onboardingItems});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(navigatorKeyProvider);

    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Consumer(builder: (context, watch, child) {
              final currentIndex = ref.watch(onboardingIndexProvider);
              if (kDebugMode) {
                print(
                    'DotsLineIndicator rebuilt with currentIndex: $currentIndex');
              }
              return DotsLineIndicator(
                itemCount: onboardingItems.length,
                currentIndex: currentIndex,
              );
            }),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 20, left: 35, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo/logo.png',
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Bienvenue à YallaPlay',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight
                                .w600, // Use FontWeight.w600 for Semi-bold
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      color: AppColors.yellow,
                    ),
                    onPressed: () {
                      navigator.currentState?.pushReplacementNamed('/connect');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingItems.length,
                itemBuilder: (context, index) {
                  String buttonText = index == onboardingItems.length - 1
                      ? 'Commencer l\'expérience'
                      : 'Suivant';
                  return OnboardingPage(
                    item: onboardingItems[index],
                    onNextPressed: () {
                      final currentIndex = _pageController.page?.toInt() ?? 0;
                      if (currentIndex == onboardingItems.length - 1) {
                        // Navigate to sign-in page
                        navigator.currentState
                            ?.pushReplacementNamed('/connect');
                      } else {
                        // Move to the next page
                        _pageController.animateToPage(
                          currentIndex + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    buttonText: buttonText,
                    index: index,
                    onboardingItems: onboardingItems,
                  );
                },
                onPageChanged: (index) {
                  if (kDebugMode) {
                    print('Page changed to index $index');
                  }
                  ref.read(onboardingIndexProvider.notifier).state = index;
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class OnboardingPage extends ConsumerWidget {
  final OnboardingItem item;
  final VoidCallback onNextPressed;
  final String buttonText;
  final int index;
  final List<OnboardingItem> onboardingItems;

  const OnboardingPage(
      {super.key,
      required this.item,
      required this.onNextPressed,
      required this.buttonText,
      required this.onboardingItems,
      required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(navigatorKeyProvider);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              item.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 70),
              child: Container(
                color: item.textColor,
                child: Text(
                  item.title,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight:
                          FontWeight.w600, // Use FontWeight.w600 for Semi-bold
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 60, left: 60),
              child: Container(
                color: item.descriptionColor,
                child: Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight:
                          FontWeight.w600, // Use FontWeight.w600 for Semi-bold
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 20),
              child: Image.asset(
                item.imageUrl,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                if (kDebugMode) {
                  print('Button pressed for index $index');
                }
                onNextPressed();
                if (index == onboardingItems.length - 1) {
                  // Set onboardingShown to true
                  final sharedPreferences =
                      await SharedPreferences.getInstance();
                  await sharedPreferences.setBool('onboardingShown', true);

                  // Navigate to the next screen
                  navigator.currentState?.pushReplacementNamed('/connect');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: index == onboardingItems.length - 1
                    ? const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                    : const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500, // Use FontWeight.w500 for Medium
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotsLineIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const DotsLineIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              width: 100.0,
              height: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColors.darkyellow
                    : AppColors.yellow,
              ),
            ),
          );
        },
      ),
    );
  }
}
