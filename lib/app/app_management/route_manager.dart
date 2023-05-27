import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/features/auth/presentation/screens/login_screen.dart';
import 'package:dr_purple/features/auth/presentation/screens/register_screen.dart';
import 'package:dr_purple/features/splash/presentation/screens/get_started_screen.dart';
import 'package:dr_purple/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  /// shared routes
  static const String splashRoute = "/";
  static const String getStartedRoute = "getStarted";
  static const String loginRoute = "login";
  static const String forgotPasswordRoute = "forgotPassword";
  static const String resetPasswordRoute = "resetPassword";
  static const String registerRoute = "register";
  static const String homeRoute = "home";
  static const String settingsRoute = "settings";
  static const String languageRoute = "language";
  static const String changePasswordRoute = "changePassword";
  static const String editProfileRoute = "editProfile";
  static const String accountRoute = "account";
}

class RouteGenerator {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      /// shared routes
      GoRoute(
        path: Routes.splashRoute,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: Routes.getStartedRoute,
            builder: (BuildContext context, GoRouterState state) =>
                const GetStartedScreen(),
          ),
          GoRoute(
            path: Routes.loginRoute,
            builder: (BuildContext context, GoRouterState state) =>
                const LoginScreen(),
          ),
          GoRoute(
            path: Routes.registerRoute,
            builder: (BuildContext context, GoRouterState state) {
              initRegisterModule();
              return const RegisterScreen();
            },
          ),
        ],
      ),
    ],
  );
}

class UpwardsPage extends CustomTransitionPage {
  UpwardsPage({required GoRouterState state, required Widget child})
      : super(
          key: state.pageKey,
          child: child,
          transitionDuration: AppDurations.superFast,
          reverseTransitionDuration: AppDurations.superFast,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const builder = OpenUpwardsPageTransitionsBuilder();
            return builder.buildTransitions(
              null,
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
        );
}
