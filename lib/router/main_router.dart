import 'package:flutter/material.dart';

import '../modules/authentication/request_failure.dart';
import '../modules/authentication/sign_in.dart';
import '../modules/onboarding/splash.dart';
import 'route_paths.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RoutePaths.authFailure:
        return MaterialPageRoute(
          builder: (_) => AuthenticationFailure(
            authMessage: settings.arguments.toString(),
          ),
        );

      // case RoutePaths.bottomNav:
      //   return MaterialPageRoute(builder: (_) => const BottomNav());
      // case RoutePaths.success:
      //   List<dynamic> args = settings.arguments as List;
      //   return MaterialPageRoute(
      //       builder: (_) => SuccessScreen(
      //             title: args[0],
      //             subtitle: args[1],
      //             btnText: args[2],
      //           ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
