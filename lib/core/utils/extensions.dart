import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/core/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';

extension NonNullString on String? {
  String messageOrEmpty({String? message}) => this ?? message ?? "";
}

extension NonNullInteger on int? {
  int numberOrZero({int? number}) => this ?? number ?? 0;
}

extension TrueOrFalse on int? {
  bool boolValue() => this == null || this == 0 ? false : true;
}

extension GenderExt on Gender {
  String getLocalizedString() {
    switch (this) {
      case Gender.male:
        return AppStrings.male.tr();
      case Gender.female:
        return AppStrings.female.tr();
    }
  }

  int getServerValue() {
    switch (this) {
      case Gender.male:
        return 1;
      case Gender.female:
        return 2;
    }
  }
}
