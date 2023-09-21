import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/features/login/domain/entities/user_entity.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.unauthorized() = UnauthorizedStatus;
  const factory AuthStatus.authorized(UserEntity user) = AuthorizedStatus;

  const AuthStatus._();
}
