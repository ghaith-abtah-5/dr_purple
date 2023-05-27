// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAPIResponse _$RegisterAPIResponseFromJson(Map<String, dynamic> json) =>
    RegisterAPIResponse(
      result: json['result'] == null
          ? null
          : RegisterAPIResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegisterAPIResponseToJson(
        RegisterAPIResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

RegisterAPIResult _$RegisterAPIResultFromJson(Map<String, dynamic> json) =>
    RegisterAPIResult(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$RegisterAPIResultToJson(RegisterAPIResult instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
