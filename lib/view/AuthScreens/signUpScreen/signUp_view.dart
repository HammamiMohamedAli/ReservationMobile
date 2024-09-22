// ignore_for_file: file_names, unnecessary_null_comparison, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unused_local_variable, unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/common/utils.dart';
import 'package:yallaplay_mobile/service/repositories/auth_repository.dart';
import 'package:yallaplay_mobile/view/AuthScreens/signUpScreen/signUp_view_model.dart';

import '../../../main.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider((ref) => SignUpViewModel(AuthService()));

class SignUpView extends ConsumerWidget {
  final controllerName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpViewModel = ref.watch(signUpViewModelProvider);
    final navigator = ref.watch(navigatorKeyProvider);

    const int maxImageSizeBytes = 5 * 1024 * 1024; // 5 MB as an example
    const List<String> supportedImageFormats = ['jpg', 'jpeg', 'png', 'gif'];
    Future<void> pickImage(BuildContext context) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
          source: ImageSource.gallery, maxHeight: 100, maxWidth: 100);
      if (image != null) {
        final File pickedImage = File(image.path);
        // Add additional checks for image size and format here
        if (pickedImage.lengthSync() > maxImageSizeBytes) {
          Utils.showError("Image size exceeds the limit");
          return;
        }
        if (!supportedImageFormats
            .contains(pickedImage.path.split('.').last.toLowerCase())) {
          Utils.showError("Unsupported image format");
          return;
        }
        ref.read(signUpViewModelProvider).state.userImage = pickedImage;
        ref.read(signUpViewModelProvider).notifyListeners();
      }
    }

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 20),
                    child: SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assets/logo/logoYallaPlay.png',
                        width: 500,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Positioned(
                        left: 138,
                        top: 10,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text('S\'inscrire',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight
                                    .w600, 
                                fontSize: 21)),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightgrey3,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: signUpViewModel.state.userImage == null
                                ? Image.asset(
                                    'assets/icons/user.png',
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(
                                        signUpViewModel.state.userImage!),
                                    radius: 50,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 60,
                        child: GestureDetector(
                          onTap: () => pickImage(context),
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellow,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                              ),
                              child: const Icon(Icons.add_a_photo,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Ajouter une photo',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerName,
                        decoration: InputDecoration(
                          labelText: 'Nom',
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
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          controllerName.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controllerLastName,
                        decoration: InputDecoration(
                          labelText: 'Prénom',
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
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre prénom';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controllerLastName.text = value!;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controllerEmail,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre email';
                          } else if (!ref
                              .read(signUpViewModelProvider)
                              .isValidEmail(value)) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controllerEmail.text = value!;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controllerPhone,
                        decoration: InputDecoration(
                          labelText: 'Numéro de téléphone',
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
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controllerPhone.text = value!;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controllerPassword,
                        obscureText: !signUpViewModel.state.isPasswordVisible,
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
                              icon: signUpViewModel.state.isPasswordVisible
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
                                    .read(signUpViewModelProvider)
                                    .togglePasswordVisibility();
                              },
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          } else if (value.length < 6) {
                            return 'Le mot de passe doit contenir au moins 6 caractères';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controllerPassword.text = value!;
                        },
                      ),

                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controllerConfirmPassword,
                        obscureText:
                            !signUpViewModel.state.isConfirmPasswordVisible,
                        decoration: InputDecoration(
                            labelText: 'Confirmer mot de passe',
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
                              icon:
                                  signUpViewModel.state.isConfirmPasswordVisible
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
                                    .read(signUpViewModelProvider)
                                    .toggleConfirmPasswordVisibility();
                              },
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez confirmer votre mot de passe';
                          } else if (value != controllerPassword.text) {
                            return 'Les mots de passe ne correspondent pas';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controllerConfirmPassword.text = value!;
                        },
                      ),
                      RadioListTile<bool>(
                        title: const Text('Femme'),
                        value: false,
                        groupValue: signUpViewModel.state.isMaleSelected,
                        onChanged: (value) {
                          ref
                              .read(signUpViewModelProvider)
                              .toggleGender(value!);
                        },
                      ),
                      RadioListTile<bool>(
                        title: const Text('Homme'),
                        value: true,
                        groupValue: signUpViewModel.state.isMaleSelected,
                        onChanged: (value) {
                          ref
                              .read(signUpViewModelProvider)
                              .toggleGender(value!);
                        },
                      )
                      // .setGender(value!)),
                    ],
                  ),
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
                    formKey.currentState?.validate();
                    if (formKey.currentState!.validate()) {
                      final payload = {
                        'first_name': controllerName.text,
                        'last_name': controllerLastName.text,
                        'email': controllerEmail.text,
                        'phone': controllerPhone.text,
                        'password': controllerPassword.text,
                        'gender': signUpViewModel.state.gender,
                      };
                    
                   
                     signUpViewModel.signUp(context, payload);

                    }
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightgrey3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                  ),
                  child: const Text(
                    'S\'inscrire',
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
                        text: 'Avez-vous un compte ?',
                      ),
                      TextSpan(
                        text: ' Se connecter',
                        style: const TextStyle(
                          color: AppColors.darkyellow,
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            navigator.currentState
                                ?.pushReplacementNamed('/signIn');
                            ref.read(signUpViewModelProvider).resetState();
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
    );
  }
}
