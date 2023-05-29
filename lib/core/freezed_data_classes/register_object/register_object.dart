import 'package:dr_purple/core/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_object.freezed.dart';

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
    String contactNumber,
    String address,
    Gender gender,
  ) = _RegisterObject;
}
