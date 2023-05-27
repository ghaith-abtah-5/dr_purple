import 'package:dr_purple/app/app_management/media/data/remote/models/params/media_upload_params.dart';
import 'package:dr_purple/app/app_management/media/data/remote/models/responses/background_uploader_response/background_uploader_response.dart';
import 'package:dr_purple/core/features/data/remote_data_source/remote_data_source.dart';

abstract class IBackgroundUploaderRemoteDataSource extends RemoteDataSource {
  IBackgroundUploaderRemoteDataSource(
    super.dio,
    super._appPreferences,
  );

  Future<BackgroundUploaderResponse> enqueueFile(
      MediaUploadParams mediaUploadParams);
}

class BackgroundUploaderRemoteDataSource
    extends IBackgroundUploaderRemoteDataSource {
  BackgroundUploaderRemoteDataSource(
    super.dio,
    super._appPreferences,
  );

  @override
  Future<BackgroundUploaderResponse> enqueueFile(
      MediaUploadParams mediaUploadParams) async {
    var res = await uploadFile(mediaUploadParams);
    return Future.value(BackgroundUploaderResponse.fromJson(res));
  }
}
