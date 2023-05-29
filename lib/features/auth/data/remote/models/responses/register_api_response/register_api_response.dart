import 'package:dr_purple/core/features/data/remote_data_source/models/responses/base_response_model.dart';
import 'package:dr_purple/features/auth/domain/entities/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_api_response.g.dart';

@JsonSerializable()
class RegisterAPIResponse extends BaseResponseModel {
  @JsonKey(name: "data")
  RegisterAPIResult? result;

  RegisterAPIResponse({required this.result});

  factory RegisterAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAPIResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterAPIResponseToJson(this);

  @override
  RegisterEntity toEntity() => RegisterEntity(
        accessToken: result?.accessToken,
        refreshToken: result?.refreshToken,
      );
}

@JsonSerializable()
class RegisterAPIResult {
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "refreshToken")
  String? refreshToken;

  RegisterAPIResult({required this.accessToken, required this.refreshToken});

  factory RegisterAPIResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterAPIResultFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAPIResultToJson(this);
}
