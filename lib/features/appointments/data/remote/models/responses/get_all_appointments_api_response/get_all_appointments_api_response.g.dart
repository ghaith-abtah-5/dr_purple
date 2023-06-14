// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_appointments_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAppointmentsAPIResponse _$GetAllAppointmentsAPIResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllAppointmentsAPIResponse()
      ..succsess = json['succsess'] as bool?
      ..messageId = json['messageId'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetAllAppointmentsAPIResponseToJson(
        GetAllAppointmentsAPIResponse instance) =>
    <String, dynamic>{
      'succsess': instance.succsess,
      'messageId': instance.messageId,
      'message': instance.message,
    };
