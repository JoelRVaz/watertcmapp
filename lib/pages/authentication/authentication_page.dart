import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:watertcmapp/pages/authentication/widgets/custom_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/pages/authentication/widgets/loading_poppup.dart';
import 'package:watertcmapp/widgets/custom_text/pop_up_text.dart';
import 'package:watertcmapp/widgets/custom_text_input.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/widgets/alert_widgets/custom_alert_dialog.dart';

class AuthenticationPage extends ConsumerStatefulWidget {
  final Function(bool success)? onResult;
  const AuthenticationPage({Key? key, this.onResult}) : super(key: key);

  @override
  AuthenticationPageState createState() => AuthenticationPageState();
}

class AuthenticationPageState extends ConsumerState<AuthenticationPage> {
  String? userEmail;
  String? userPassword;

  @override
  Widget build(BuildContext context) {
    final emailInput = TextEditingController();
    final passwordInput = TextEditingController();

    AuthNotifier auth = ref.watch(authProvider.notifier);

    Future<void> submit({String? email, String? password}) async {
      loadingPopUp(
        context: context, 
        future: auth
          .login(
            email: email ?? "cathy123@promagenviro.ca",
            password: password ?? "Prom@g123"
          ), 
        onFinish: (name) {
          if (widget.onResult != null) {
            widget.onResult!(true);
          } else {
            context.router.pushNamed('/');
          }
          return Center(
            child: PopUpText(text: 'Welcome '+ (name ?? ''), size: 18),
          );
        },
        onError: (error) {
          print("fddgd");
          var errorMessage = jsonDecode(error.toString());
          CustomAlertDialog(
              context: context,
              title: errorMessage['Message'] ?? 'Oops!',
              body: errorMessage['Description'] ?? 'Something went wrong'
          );
        }
      );
    }

    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/profile.png', width: 100),
              const SizedBox(height: 30),
              CustomTextInput(
                  hintText: "Email",
                  icon: Icons.person,
                  controller: emailInput),
              const SizedBox(height: 15),
              CustomTextInput(
                hintText: "Password",
                icon: Icons.lock,
                controller: passwordInput,
                obscureText: true,
                enableSuggestions: false,
                autoCorrect: false,
              ),
              const SizedBox(height: 23),
              CustomButton(
                onPressed: () => submit(),
                title: 'Login',
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: "Create an account",
                onPressed: () {
                  context.router.navigateNamed('/Auth/Register');
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: "Forgot password",
                onPressed: () {
                  context.router.navigateNamed('/Auth/AccountRecovery');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
