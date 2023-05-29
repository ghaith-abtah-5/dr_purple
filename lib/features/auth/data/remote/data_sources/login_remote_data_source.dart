import 'package:dr_purple/core/features/data/remote_data_source/remote_data_source.dart';
import 'package:dr_purple/features/auth/data/remote/models/params/login/login_params.dart';
import 'package:dr_purple/features/auth/data/remote/models/responses/login_api_response/login_api_response.dart';

abstract class ILoginRemoteDataSource extends RemoteDataSource {
  ILoginRemoteDataSource(super.dio, super._appPreferences);

  Future<LoginAPIResponse> login(LoginParams loginParams);
}

class LoginRemoteDataSource extends ILoginRemoteDataSource {
  LoginRemoteDataSource(super.dio, super._appPreferences);

  @override
  Future<LoginAPIResponse> login(LoginParams loginParams) async {
    var res = await post(loginParams);
    return Future.value(LoginAPIResponse.fromJson(res));
  }
}
