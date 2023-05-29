import 'package:dr_purple/core/features/domain/entities/entity.dart';

abstract class BaseResponseModel {
  bool? succsess;
  String? messageId;
  String? message;

  Map<String, dynamic> toJson() => {};

  Entity toEntity();
}
