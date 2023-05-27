// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_uploader_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundUploaderResponse _$BackgroundUploaderResponseFromJson(
        Map<String, dynamic> json) =>
    BackgroundUploaderResponse(
      taskId: json['taskId'] as String?,
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BackgroundUploaderResponseToJson(
        BackgroundUploaderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'taskId': instance.taskId,
    };
