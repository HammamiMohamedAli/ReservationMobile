import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/model/Onboarding.dart';
import 'package:yallaplay_mobile/view/onboardingScreen/onboarding_View.dart';

class OnboardingWrapper extends StatelessWidget {
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
        title: '  Jouez avec vos amis  ',
        description: ' & participez à des tournois!   ',
        imageUrl: 'assets/images/splashScreen1.png',
        image: 'assets/background/background1.png',
        textColor: AppColors.darkyellow,
        descriptionColor: AppColors.darkyellow),
    OnboardingItem(
        title: '  Trouvez les stades  ',
        description: ' & les clubs proches :D  ',
        imageUrl: 'assets/images/splashScreen2.png',
        image: 'assets/background/background2.png',
        textColor: AppColors.yellow,
        descriptionColor: AppColors.darkyellow),
    OnboardingItem(
      title: '  Ne ratez rien!  ',
      description: ' & Suivez les tournois  ',
      imageUrl: 'assets/images/splashScreen3.png',
      image: 'assets/background/background3.png',
      textColor: AppColors.darkyellow,
      descriptionColor: AppColors.yellow,
    ),
  ];

  OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: OnboardingView(onboardingItems: onboardingItems),
    );
  }
}
