import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/login/data/repositories/authorization_repository.dart';
import 'package:todoapp/features/login/domain/entities/user_entity.dart';
import 'package:todoapp/features/login/presentation/cubits/login_state.dart';

// Global variable for the user state
UserEntity? userCubitData;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authorizatonRepository,
  }) : super(const LoginState.initial());

  final AuthorizationRepository authorizatonRepository;

  /// Login with Google
  Future<void> login() async {
    emit(const LoginState.loading());
    // await Future.delayed(const Duration(seconds: 2));

    final result = await authorizatonRepository.loginWithGoogle();

    if (result != null) {
      userCubitData = result;
      emit(LoginState.success(result));
    } else {
      emit(const LoginState.failure('Login failed'));
    }
  }
}
