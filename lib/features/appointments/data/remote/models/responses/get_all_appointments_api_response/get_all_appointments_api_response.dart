import 'package:dr_purple/core/features/data/remote_data_source/models/responses/base_response_model.dart';
import 'package:dr_purple/features/appointments/domain/entities/get_all_appointments_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_appointments_api_response.g.dart';

@JsonSerializable()
class GetAllAppointmentsAPIResponse extends BaseResponseModel {
  GetAllAppointmentsAPIResponse();

  factory GetAllAppointmentsAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllAppointmentsAPIResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetAllAppointmentsAPIResponseToJson(this);

  @override
  GetAllAppointmentsEntity toEntity() => GetAllAppointmentsEntity();
}
