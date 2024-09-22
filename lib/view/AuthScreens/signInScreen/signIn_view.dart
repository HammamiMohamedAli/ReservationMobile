// ignore_for_file: file_names, dead_code

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/main.dart';
import 'package:yallaplay_mobile/view/AuthScreens/signInScreen/signIn_view_model.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/sportSectionScreen/section_view.dart';

final signInViewModelProvider = ChangeNotifierProvider<SignInViewModel>((ref) {
  return SignInViewModel();
});

class SignInView extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInViewModel = ref.watch(signInViewModelProvider);
    // final signInViewModel = ref.read(signInViewModelProvider);
    final navigator = ref.watch(navigatorKeyProvider);
    final formKey = GlobalKey<FormState>();
    // final isLoading = signInViewModel.isLoading;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // height: double.infinity,widget
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/background/background4.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
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
                        child: Text('Se connecter',
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: AppColors.lightgrey2,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(
                              color: AppColors.lightgrey3,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 40.0),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un correct mot de passe';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: !signInViewModel.state.isPasswordVisible,
                        decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            filled: true,
                            fillColor: AppColors.lightgrey2,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: const TextStyle(
                                color: AppColors.lightgrey3,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 40.0),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: IconButton(
                              icon: signInViewModel.state.isPasswordVisible
                                  ? const Icon(
                                      Icons.visibility,
                                      color: AppColors.lightgrey3,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.lightgrey3,
                                    ),
                              onPressed: () {
                                ref
                                    .read(signInViewModelProvider)
                                    .togglePasswordVisibility();
                              },
                            )),
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 245.0, bottom: 40),
                  child: Text(
                    'Forgot password ?',
                    style: TextStyle(
                      color: AppColors.lightgrey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var user = await signInViewModel.signIn(
                            emailController.text, passwordController.text,
                            showLoader: true);
                        // ignore: unnecessary_null_comparison
                        if (user!.id != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SectionView(),
                            ),
                          );
                        } else {
                          if (kDebugMode) {
                            print('failed login');
                            emailController.clear();
                            passwordController.clear();
                          }
                        }
                      }
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
                      'Connexion',
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.greyA,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Vous n\'avez pas un compte ?',
                        ),
                        TextSpan(
                          text: ' S\'inscrire',
                          style: const TextStyle(
                            color: AppColors.darkyellow,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigator.currentState
                                  ?.pushReplacementNamed('/signUp');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Problème d\'authentification ?',
                    style: TextStyle(
                      color: AppColors.lightgrey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
