import 'package:dr_purple/app/app_management/app_lifecycle_management/app_lifecycle_management.dart';
import 'package:dr_purple/app/app_management/language_manager/language_manager.dart';
import 'package:dr_purple/app/app_management/media/data/remote/data_sources/background_uploader_remote_data_source.dart';
import 'package:dr_purple/app/app_management/media/data/repositories/background_uploader_repository.dart';
import 'package:dr_purple/app/app_management/media/domain/use_cases/background_uploader_use_case.dart';
import 'package:dr_purple/app/app_management/media/presentation/blocs/media_upload_bloc/media_upload_bloc.dart';
import 'package:dr_purple/app/storage/app_preferences.dart';
import 'package:dr_purple/core/network/dio_factory.dart';
import 'package:dr_purple/core/network/network_info.dart';
import 'package:dr_purple/core/services/notification_service/notification_service.dart';
import 'package:dr_purple/features/auth/presentation/bloc/country_code_cubit/country_code_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  ///register shared preferences as lazy singleton
  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }

  ///register app preference as lazy singleton
  if (!GetIt.I.isRegistered<AppPreferences>()) {
    instance.registerLazySingleton<AppPreferences>(
        () => AppPreferences(instance<SharedPreferences>()));
  }

  ///register network info as lazy singleton
  if (!GetIt.I.isRegistered<NetworkInfoImpl>() &&
      !GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(InternetConnectionChecker()));
  }

  ///register dio factory as lazy singleton
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(
        () => DioFactory(instance<AppPreferences>()));
  }

  ///register language manager as lazy singleton
  if (!GetIt.I.isRegistered<LanguageManager>()) {
    instance.registerLazySingleton<LanguageManager>(
        () => LanguageManager(instance<AppPreferences>()));
  }

  ///register notification service as lazy singleton
  if (!GetIt.I.isRegistered<NotificationService>()) {
    instance.registerLazySingleton<NotificationService>(
        () => NotificationService());
  }

  ///register Background Uploader Remote Data Source as lazy singleton
  if (!GetIt.I.isRegistered<BackgroundUploaderRemoteDataSource>()) {
    instance.registerLazySingleton<BackgroundUploaderRemoteDataSource>(
        () => BackgroundUploaderRemoteDataSource(
              instance<DioFactory>().getDio(),
              instance<AppPreferences>(),
            ));
  }

  ///register Background Uploader Repository as lazy singleton
  if (!GetIt.I.isRegistered<BackgroundUploaderRepository>()) {
    instance.registerLazySingleton<BackgroundUploaderRepository>(
        () => BackgroundUploaderRepository(
              instance<BackgroundUploaderRemoteDataSource>(),
              instance<NetworkInfo>(),
            ));
  }

  ///register Background Uploader use case as lazy singleton
  if (!GetIt.I.isRegistered<BackgroundUploaderUseCase>()) {
    instance.registerLazySingleton<BackgroundUploaderUseCase>(() =>
        BackgroundUploaderUseCase(instance<BackgroundUploaderRepository>()));
  }

  ///register media upload bloc as lazy singleton
  if (!GetIt.I.isRegistered<MediaUploadBloc>()) {
    instance.registerLazySingleton<MediaUploadBloc>(
        () => MediaUploadBloc(instance<BackgroundUploaderUseCase>()));
  }

  ///register App Brought Foreground Management as lazy singleton
  if (!GetIt.I.isRegistered<AppLifecycleActions>()) {
    instance.registerLazySingleton<AppLifecycleActions>(
        () => AppLifecycleActions());
  }
}

void neededInBackgroundUploaderModule() {
  if (!GetIt.I.isRegistered<NotificationService>()) {
    ///register notification service as lazy singleton
    instance.registerLazySingleton<NotificationService>(
        () => NotificationService());
  }

  ///register media upload bloc as lazy singleton
  if (!GetIt.I.isRegistered<MediaUploadBloc>()) {
    instance.registerLazySingleton<MediaUploadBloc>(
        () => MediaUploadBloc(instance<BackgroundUploaderUseCase>()));
  }
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<CountryCodeCubit>()) {
    ///register Country Code Cubit as factory
    instance.registerFactory<CountryCodeCubit>(() => CountryCodeCubit());
  }
}
