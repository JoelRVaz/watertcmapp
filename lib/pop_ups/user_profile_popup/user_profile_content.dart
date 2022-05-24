import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/widgets/custom_text/pop_up_text.dart';

class UserProfliePopUpContent extends ConsumerWidget {
  const UserProfliePopUpContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(authProvider);
    return Column(
      children: [
        PopUpText(
          text: userProfile.userData?['Profile']['FullName'] ?? '',
          size: 22,
        ),
        TextButton(
            onPressed: () {
              context.router.navigateNamed('/Auth');
              ref.watch(authProvider.notifier).logOut();
            },
            child: const PopUpText(text: 'Log out'))
      ],
    );
  }
}
