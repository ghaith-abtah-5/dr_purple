import 'package:dr_purple/core/features/domain/entities/entity.dart';

abstract class BaseResponseModel {
  bool? success;
  int? code;
  String? message;

  Map<String, dynamic> toJson() => {};

  Entity toEntity();
}
