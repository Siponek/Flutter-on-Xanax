import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/features/login/domain/entities/user_entity.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _InitialState;
  const factory LoginState.loading() = _LoadingState;
  const factory LoginState.success(UserEntity user) = _DataState;
  const factory LoginState.failure(String failureMessage) = _FailureState;

  const LoginState._();
}
