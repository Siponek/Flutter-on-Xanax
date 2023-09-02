import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/login/data/repositories/authorization_repository.dart';
import 'package:todoapp/features/login/presentation/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authorizatonRepository,
  }) : super(const LoginState.initial());

  final AuthorizationRepository authorizatonRepository;

  /// Login with Google
  Future<void> login() async {
    emit(const LoginState.loading());

    final result = await authorizatonRepository.loginWithGoogle();

    if (result != null) {
      emit(LoginState.success(result));
    } else {
      emit(const LoginState.failure('Login failed'));
    }
  }
}
