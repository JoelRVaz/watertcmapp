import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';
import 'package:watertcmapp/widgets/custom_text_input.dart';
import 'package:watertcmapp/pages/authentication/widgets/custom_button.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/widgets/alert_widgets/custom_alert_dialog.dart';


class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final emailInput = TextEditingController();
    AuthNotifier auth = ref.watch(authProvider.notifier);

    void submit() {
      auth.forgotPassword(
        email: emailInput.text,
      ).then((value) {
        CustomAlertDialog(
          context: context,
          title: 'User Verification',
          body: 'Please check your email for a verification link'
        );      
      }).onError((error, stackTrace) {
        var errorMessage = jsonDecode(error.toString());
        CustomAlertDialog(
          context: context,
          title: errorMessage['Message'] ?? 'Oops!',
          body: errorMessage['Description'] ?? 'Something went wrong'
        );
      });
    }
    return SingleChildScrollView(
      child:Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          constraints: const BoxConstraints(maxWidth: 400),
          height: 500.0,
          child: Column(
            children: [
              const CustomText(text: "Account recovery", size: 30),
              const SizedBox(height: 20),
              CustomTextInput(
                hintText: "Email", 
                icon: Icons.person,
                controller: emailInput
              ),
              const SizedBox(height: 23),
              CustomButton(title: "Send verification email", 
                onPressed: () => submit()
              ),
              const SizedBox(height: 10),
              CustomButton(title: "Sign in", 
                onPressed: () {context.router.pushNamed('/Auth');},
              ),
            ],
          ),
        ),
      )
    );
  }
}