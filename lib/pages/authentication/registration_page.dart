import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/pages/authentication/widgets/custom_button.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/widgets/alert_widgets/custom_alert_dialog.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';
import 'package:watertcmapp/widgets/custom_text_input.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameInput = TextEditingController();
    final lastNameInput = TextEditingController();
    final emailInput = TextEditingController();
    final passwordInput = TextEditingController();
    final companyInput = TextEditingController();
    AuthNotifier auth = ref.watch(authProvider.notifier);
    void submit() {
      auth
          .registerUser(
              companyName: companyInput.text,
              firstName: firstNameInput.text,
              email: emailInput.text,
              password: passwordInput.text,
              lastName: lastNameInput.text)
          .then((value) {
        print(value);
      }).onError((error, stackTrace) {
        var errorMessage = jsonDecode(error.toString());
        CustomAlertDialog(
            context: context,
            title: errorMessage['Message'] ?? 'Oops!',
            body: errorMessage['Description'] ?? 'Something went wrong');
      });
    }

    return SingleChildScrollView(
      child: Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        constraints: const BoxConstraints(maxWidth: 400),
        height: 700.0,
        child: Column(
          children: [
            const CustomText(text: "Create an account", size: 30),
            const SizedBox(height: 20),
            CustomTextInput(
              hintText: "First name",
              icon: Icons.person,
              controller: firstNameInput,
            ),
            const SizedBox(height: 15),
            CustomTextInput(
              hintText: "Last name",
              icon: Icons.person,
              controller: lastNameInput,
            ),
            const SizedBox(height: 15),
            CustomTextInput(
              hintText: "Email",
              icon: Icons.person,
              controller: emailInput,
            ),
            const SizedBox(height: 15),
            CustomTextInput(
              hintText: "Password",
              icon: Icons.lock,
              controller: passwordInput,
              obscureText: true,
              enableSuggestions: false,
              autoCorrect: false,
            ),
            const SizedBox(height: 15),
            CustomTextInput(
              hintText: "Company name",
              icon: Icons.lock,
              controller: companyInput,
            ),
            const SizedBox(height: 23),
            CustomButton(title: "Register", onPressed: () => submit()),
            const SizedBox(height: 10),
            CustomButton(
                title: "Already have an account? sign in?",
                onPressed: () {
                  context.router.pushNamed('/Auth');
                })
          ],
        ),
      ),
    ));
  }
}
