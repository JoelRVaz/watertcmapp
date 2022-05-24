import 'package:auto_route/auto_route.dart';
import 'package:watertcmapp/locator.dart';
import 'package:watertcmapp/navigation/main_router.gr.dart';
import 'package:watertcmapp/providers/auth_provider/auth_provider.dart';

class AuthGuard extends AutoRedirectGuard {
  bool isAuthenticated = false;
  AuthNotifier auth = locator<AuthNotifier>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    print("---4545");
    if (auth.state.isAuthenticated) {
      resolver.next();
    } else {
      // we redirect the user to our login page
      router.navigate(AuthPagesRoute(children: [
        AuthenticationPageRoute(onResult: (success) {
          resolver.next(success);
        })
      ]));
    }
  }

  void authListener() {
    AuthNotifier auth = locator<AuthNotifier>();
    auth.addListener((state) {
      print("changes");
      reevaluate();
    });
  }

  AuthGuard() {
    authListener();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return true;
  }
}
