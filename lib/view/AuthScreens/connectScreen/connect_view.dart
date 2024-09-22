// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/main.dart';
import 'package:yallaplay_mobile/view/AuthScreens/connectScreen/connect_view_model.dart';

class ConnectView extends ConsumerWidget {
  const ConnectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectViewModel = ref.read(connectViewModelProvider);
    final navigator = ref.watch(navigatorKeyProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo/logoYallaPlay.png', width: 500),
                    Stack(alignment: AlignmentDirectional.topStart, children: [
                      Positioned(
                        left: 12,
                        top: 8,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
                        child: Text('Bonjour!',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight
                                    .w600, // Use FontWeight.w600 for Semi-bold
                                fontSize: 21)),
                      ),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    navigator.currentState?.pushReplacementNamed('/signIn');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                  ),
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight:
                          FontWeight.w500, // Use FontWeight.w500 for Medium
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    navigator.currentState?.pushReplacementNamed('/signUp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: AppColors.yellow,
                      ), // Border color
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 96),
                  ),
                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Poppins',
                      fontWeight:
                          FontWeight.w500, // Use FontWeight.w500 for Medium
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 250, // Set the width as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.darkgrey,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      child: Text(
                        'Ou connecter avec',
                        style: TextStyle(
                          color: AppColors.greyA,
                          fontFamily: 'Poppins',
                          fontWeight:
                              FontWeight.w500, // Use FontWeight.w500 for Medium
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.darkgrey,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/google.png',
                      height: 50,
                      width: 50,
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      await connectViewModel.signInWithFacebook();
                      //navigator.currentState?.pushReplacementNamed('/signIn');
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/apple.png',
                      height: 50,
                      width: 50,
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      await connectViewModel.signInWithGoogle();
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/facebook.png',
                      height: 50,
                      width: 50,
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      await connectViewModel.signInWithApple();
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  'Problème d\'authentification ?',
                  style: TextStyle(
                    color: AppColors.lightgrey,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight:
                        FontWeight.w500, // Use FontWeight.w500 for Medium
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
