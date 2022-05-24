import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/constants/colors.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp/widgets/custom_icon.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';

class SideBar extends ConsumerStatefulWidget {
  final bool isDisplayed;
  const SideBar({Key? key, this.isDisplayed = false}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {
  TabsRouter? tabsRouter;

  int tabberIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      tabsRouter = AutoTabsRouter.of(context);
      tabsRouter?.addListener(() {
        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              tabberIndex = tabsRouter!.activeIndex;
            });
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void navigate(int index) {
      !widget.isDisplayed ? Navigator.pop(context) : null;
      tabsRouter!.setActiveIndex(index);
    }

    int currentTabIndex = tabsRouter?.activeIndex ?? 0;
    return Drawer(
        backgroundColor: secondaryColor,
        child: ListView(
          children: [
            const SizedBox(height: 60),
            ListTile(
              selected: currentTabIndex == 0,
              selectedTileColor: Colors.blue,
              title: const CustomText(text: 'Home'),
              leading: const CustomIcon(icon: Icons.trending_up),
              onTap: () => navigate(0),
            ),
            ListTile(
                title: const CustomText(text: 'Devices'),
                selected: currentTabIndex == 1,
                selectedTileColor: Colors.blue,
                leading: const CustomIcon(icon: Icons.developer_board),
                onTap: () => navigate(1)),
            ListTile(
                title: const CustomText(text: 'clients'),
                selected: currentTabIndex == 2,
                selectedTileColor: Colors.blue,
                leading: const CustomIcon(icon: Icons.people_alt_sharp),
                onTap: () => navigate(2)),
            ListTile(
                title: const CustomText(text: 'Settings'),
                selected: currentTabIndex == 3,
                selectedTileColor: Colors.blue,
                leading: const CustomIcon(icon: Icons.settings),
                onTap: () => navigate(3)),
            ListTile(
                title: const CustomText(text: 'Sign Out'),
                selected: currentTabIndex == 4,
                selectedTileColor: Colors.blue,
                leading: const CustomIcon(icon: Icons.logout),
                onTap: () {
                  context.router.navigateNamed('/Auth');
                  ref.watch(authProvider.notifier).logOut();
                })
          ],
        ));
  }
}
