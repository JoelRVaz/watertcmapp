import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/pop_ups/user_profile_popup/user_profile_pop_up.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/providers/auth_provider/auth_state.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';


class TopNav extends ConsumerStatefulWidget {
  final String title;
  final Color backgroundColor;
  final Widget? leading;
  final bool showHamburger;
  final List<Widget> customTopNavActions;
  final List<Widget> customTopNavLeading;

  const TopNav(
      {Key? key,
      this.title = '',
      this.backgroundColor = primaryColor,
      this.leading,
      this.showHamburger = false,
      this.customTopNavActions = const [],
      this.customTopNavLeading = const []})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TopNavState();
}

class _TopNavState extends ConsumerState<TopNav> {

  @override
  Widget build(BuildContext context) {

    AuthState auth = ref.watch(authProvider);
    return AppBar(
      automaticallyImplyLeading: widget.showHamburger,
      backgroundColor: widget.backgroundColor,
      title: Row(
        children: widget.customTopNavLeading +
            [
              CustomText(text: widget.title, size: 20, weight: FontWeight.bold),
              Expanded(child: Container())
            ] +
            widget.customTopNavActions +
            [
              Badge(
                toAnimate: false,
                badgeColor: const Color.fromARGB(255, 0, 96, 175),
                badgeContent: const CustomText(text: '3', size: 14),
                child: const Icon(Icons.notifications),
              ),
              const SizedBox(width: 22),
              Container(
                width: 1,
                height: 22,
                color: Colors.white,
              ),
              const SizedBox(width: 24),
              CustomText(
                text: (auth.userData != null)
                    ? auth.userData['Profile']['FirstName']
                    : '',
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () => UserProfilePopup(context),
                child: Container(
                  decoration: BoxDecoration(
                      color: active.withOpacity(.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 16.5,
                  ),
                ),
              )
            ],
      ),
      elevation: 0,
    );
  }
}
