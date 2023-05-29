import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/storage/app_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppPreferences _appPreferences;

  SplashBloc(this._appPreferences) : super(SplashInitial()) {
    on<ManageAppInitState>((event, emit) async {
      await Future.delayed(AppDurations.megaSlow);

      /// check if first time opening the app
      final openFirstTime = _appPreferences.getOpenFirstTimeValue();

      /// if first time opening the app
      if (openFirstTime) {
        await _appPreferences.setOpenFirstTime(openFirstTimeValue: false);
        RouteGenerator.router.pushReplacement("/${Routes.getStartedRoute}");
      }

      /// if not first time opening the app
      else {
        /// get if user signed in
        final isUserSigned = _appPreferences.getUserSignedIn();

        /// if user not signed in
        if (!isUserSigned) {
          RouteGenerator.router.pushReplacement("/${Routes.loginRoute}");
        } else {
          RouteGenerator.router.pushReplacement("/${Routes.homeRoute}");
        }
      }
    });
  }
}
