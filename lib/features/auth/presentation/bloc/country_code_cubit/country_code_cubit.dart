import 'package:dr_purple/core/widgets/country_code_picker/src/models/country_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_code_state.dart';

class CountryCodeCubit extends Cubit<CountryCodeState> {
  CountryCodeCubit() : super(CountryCodeInitial());

  CountryCode countryCode = CountryCode.fromMap(
    const {
      "name": "Syrian Arab Republic",
      "code": "SY",
      "dial_code": "+963",
    },
  );

  changeCountryCode(CountryCode newCountryCode) {
    countryCode = newCountryCode;
    emit(CountryCodeChanged());
  }
}
