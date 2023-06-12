import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/features/appointments/presentation/screens/appointment_details_screen.dart';
import 'package:dr_purple/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:dr_purple/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:dr_purple/features/auth/presentation/screens/login_screen.dart';
import 'package:dr_purple/features/auth/presentation/screens/register_screen.dart';
import 'package:dr_purple/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:dr_purple/features/auth/presentation/screens/verify_account_screen.dart';
import 'package:dr_purple/features/home/presentation/screens/dashboard_screen.dart';
import 'package:dr_purple/features/home/presentation/screens/home_screen.dart';
import 'package:dr_purple/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:dr_purple/features/settings/presentation/screens/language_screen.dart';
import 'package:dr_purple/features/settings/presentation/screens/settings_screen.dart';
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
  static const String verifyAccountRoute = "verifyAccount";
  static const String languageRoute = "language";
  static const String settingsRoute = "/settings";
  static const String notificationsRoute = "/notifications";
  static const String appointmentsRoute = "/appointments";
  static const String appointmentDetailsRoute = "appointmentDetails";
  static const String dashboardRoute = "/dashboard";
}

class RouteGenerator {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashRoute,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// shared routes
      GoRoute(
        path: Routes.splashRoute,
        builder: (BuildContext context, GoRouterState state) {
          initSplashModule();
          return const SplashScreen();
        },
        routes: <GoRoute>[
          GoRoute(
            path: Routes.getStartedRoute,
            builder: (BuildContext context, GoRouterState state) =>
                const GetStartedScreen(),
          ),
          GoRoute(
            path: Routes.loginRoute,
            builder: (BuildContext context, GoRouterState state) {
              initLoginModule();
              return const LoginScreen();
            },
            routes: <GoRoute>[
              GoRoute(
                path: Routes.forgotPasswordRoute,
                builder: (BuildContext context, GoRouterState state) {
                  initForgetPasswordModule();
                  return const ForgetPasswordScreen();
                },
                routes: <GoRoute>[
                  GoRoute(
                    path: Routes.resetPasswordRoute,
                    builder: (BuildContext context, GoRouterState state) =>
                        const ResetPasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: Routes.registerRoute,
            builder: (BuildContext context, GoRouterState state) {
              initRegisterModule();
              return const RegisterScreen();
            },
            routes: <GoRoute>[
              GoRoute(
                path: Routes.verifyAccountRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const VerifyAccountScreen(),
              ),
            ],
          ),
        ],
      ),

      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) =>
            HomeScreen(key: state.pageKey, navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: <GoRoute>[
              GoRoute(
                path: Routes.dashboardRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <GoRoute>[
              GoRoute(
                path: Routes.appointmentsRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const AppointmentsScreen(),
                routes: <GoRoute>[
                  GoRoute(
                    path: Routes.appointmentDetailsRoute,
                    builder: (BuildContext context, GoRouterState state) =>
                        const AppointmentDetailsScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <GoRoute>[
              GoRoute(
                path: Routes.notificationsRoute,
                builder: (BuildContext context, GoRouterState state) =>
                    const NotificationsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <GoRoute>[
              GoRoute(
                path: Routes.settingsRoute,
                builder: (BuildContext context, GoRouterState state) {
                  initSettingsModule();
                  return const SettingsScreen();
                },
                routes: <GoRoute>[
                  GoRoute(
                    path: Routes.languageRoute,
                    builder: (BuildContext context, GoRouterState state) {
                      initLanguageModule();
                      return const LanguageScreen();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
