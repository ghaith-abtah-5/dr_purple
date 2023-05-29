// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAPIResponse _$RegisterAPIResponseFromJson(Map<String, dynamic> json) =>
    RegisterAPIResponse(
      result: json['data'] == null
          ? null
          : RegisterAPIResult.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..succsess = json['succsess'] as bool?
      ..messageId = json['messageId'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegisterAPIResponseToJson(
        RegisterAPIResponse instance) =>
    <String, dynamic>{
      'succsess': instance.succsess,
      'messageId': instance.messageId,
      'message': instance.message,
      'data': instance.result,
    };

RegisterAPIResult _$RegisterAPIResultFromJson(Map<String, dynamic> json) =>
    RegisterAPIResult(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RegisterAPIResultToJson(RegisterAPIResult instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
