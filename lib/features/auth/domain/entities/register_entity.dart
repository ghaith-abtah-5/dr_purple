import 'package:dr_purple/core/features/domain/entities/entity.dart';

class RegisterEntity extends Entity {
  final int? id;

  RegisterEntity({required this.id});

  @override
  List<Object?> get props => [id];
}
