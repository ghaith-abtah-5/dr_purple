import 'package:dr_purple/app/storage/app_preferences.dart';
import 'package:dr_purple/core/freezed_data_classes/register_object/register_object.dart';
import 'package:dr_purple/core/utils/constants.dart';
import 'package:dr_purple/core/utils/enums.dart';
import 'package:dr_purple/core/utils/extensions.dart';
import 'package:dr_purple/core/utils/utils.dart';
import 'package:dr_purple/features/auth/data/remote/models/params/register/register_params.dart';
import 'package:dr_purple/features/auth/domain/entities/register_entity.dart';
import 'package:dr_purple/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AppPreferences _appPreferences;
  final RegisterUseCase _registerUseCase;

  RegisterObject _registerObject = RegisterObject(
    Constants.empty,
    Constants.empty,
    Constants.empty,
    Constants.empty,
    Constants.empty,
    Constants.empty,
    Constants.empty,
    Gender.male,
  );

  bool _inputsValid = false;

  bool get inputsValid => _inputsValid;

  Gender get selectedGender => _registerObject.gender;

  RegisterBloc(this._registerUseCase, this._appPreferences)
      : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading(loadingType: RegisterBlocStateType.server));
      String errorMessage = Constants.empty;
      RegisterEntity? registerResponse;
      var res = await _registerUseCase.call(
        RegisterParams(
          body: RegisterParamsBody(
            email: _registerObject.email,
            contactNumber: "+963${_registerObject.contactNumber}",
            firstName: _registerObject.firstName,
            lastName: _registerObject.lastName,
            userName: _registerObject.userName,
            password: _registerObject.password,
            address: _registerObject.address,
            gender: _registerObject.gender.getServerValue(),
          ),
        ),
      );
      bool isError = res.fold((l) {
        errorMessage = l.message;
        return true;
      }, (r) {
        registerResponse = r;
        return false;
      });

      ///if there is an error occurred during API Request, emit error state
      if (isError) {
        emit(RegisterError(
            errorMessage: errorMessage,
            errorType: RegisterBlocStateType.server));
      } else {
        await _appPreferences.setAccessToken(
          accessTokenValue: registerResponse?.accessToken ?? Constants.empty,
        );
        await _appPreferences.setRefreshToken(
          refreshTokenValue: registerResponse?.refreshToken ?? Constants.empty,
        );
        emit(RegisterLoaded(loadedType: RegisterBlocStateType.server));
      }
    });

    on<SetRegisterPassword>((event, emit) {
      _registerObject = _registerObject.copyWith(password: event.password);
    });

    on<SetRegisterEmail>((event, emit) {
      _registerObject = _registerObject.copyWith(email: event.email);
    });

    on<SetRegisterPhoneNumber>((event, emit) {
      _registerObject =
          _registerObject.copyWith(contactNumber: event.phoneNumber);
    });

    on<SetRegisterUsername>((event, emit) {
      _registerObject = _registerObject.copyWith(userName: event.username);
    });

    on<SetRegisterFirstName>((event, emit) {
      _registerObject = _registerObject.copyWith(firstName: event.firstName);
    });

    on<SetRegisterLastName>((event, emit) {
      _registerObject = _registerObject.copyWith(lastName: event.lastName);
    });

    on<SetRegisterAddress>((event, emit) {
      _registerObject = _registerObject.copyWith(address: event.address);
    });

    on<SetRegisterGender>((event, emit) {
      _registerObject = _registerObject.copyWith(gender: event.gender);
      emit(RegisterLoaded(loadedType: RegisterBlocStateType.genderSelected));
    });

    on<RegisterValidateInputEvent>((event, emit) {
      _inputsValid = Utils.isEmailValid(_registerObject.email) &&
          Utils.isNameValid(_registerObject.userName) &&
          Utils.isNameValid(_registerObject.firstName) &&
          Utils.isNameValid(_registerObject.lastName) &&
          Utils.isPasswordValid(_registerObject.password) &&
          Utils.isPhoneNumberValid(_registerObject.contactNumber);
      emit(RegisterLoaded(loadedType: RegisterBlocStateType.validateInput));
    });
  }
}
