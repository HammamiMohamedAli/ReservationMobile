import 'dart:ui';

class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;
  final String image;
  final Color textColor;
  final Color descriptionColor;

  OnboardingItem(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.image,
      required this.textColor,
      required this.descriptionColor});
}
