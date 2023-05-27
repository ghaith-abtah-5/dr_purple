import 'package:dr_purple/core/features/data/remote_data_source/remote_data_source.dart';
import 'package:dr_purple/features/auth/data/remote/models/params/register/register_params.dart';
import 'package:dr_purple/features/auth/data/remote/models/responses/register_api_response/register_api_response.dart';

abstract class IRegisterRemoteDataSource extends RemoteDataSource {
  IRegisterRemoteDataSource(super.dio, super._appPreferences);

  Future<RegisterAPIResponse> register(RegisterParams registerParams);
}

class RegisterRemoteDataSource extends IRegisterRemoteDataSource {
  RegisterRemoteDataSource(super.dio, super._appPreferences);

  @override
  Future<RegisterAPIResponse> register(RegisterParams registerParams) async {
    var res = await post(registerParams);
    return Future.value(RegisterAPIResponse.fromJson(res));
  }
}
