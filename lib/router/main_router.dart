import 'package:flutter/material.dart';
import 'package:paytex/modules/authentication/sign_up.dart';
import 'package:paytex/modules/onboarding/splash_two.dart';
import 'package:paytex/router/route_animation.dart';

import '../modules/authentication/request_failure.dart';
import '../modules/authentication/sign_in.dart';
import '../modules/onboarding/splash.dart';
import '../modules/onboarding/splash_three.dart';
import 'route_paths.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return TransitionalRouteFade(const SplashScreen());
      case RoutePaths.splashTwo:
        return TransitionalRouteFade(const SplashScreenTwo());
      case RoutePaths.splashThree:
        return TransitionalRouteFade(const SplashScreenThree());
      case RoutePaths.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RoutePaths.signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
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
