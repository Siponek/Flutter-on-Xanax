import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/login/presentation/cubits/login_cubit.dart';
import 'package:todoapp/features/login/data/repositories/authorization_repository.dart';
import 'package:todoapp/features/login/presentation/pages/login_page/widgets/login_button.dart';

const double verticalSpacing = 48;
const String welcomeText = 'Welcome!';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: const Text('Login'));
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (blocContext) => LoginCubit(
        authorizatonRepository: blocContext.read<AuthorizationRepository>(),
      ),
      child: Builder(
        builder: (blocContext) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWelcomeText(blocContext),
              const SizedBox(height: verticalSpacing),
              const LoginButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Text(
      welcomeText,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
