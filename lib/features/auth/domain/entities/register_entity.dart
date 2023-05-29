import 'package:dr_purple/core/features/domain/entities/entity.dart';

class RegisterEntity extends Entity {
  final String? accessToken;
  final String? refreshToken;

  RegisterEntity({required this.accessToken, required this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
