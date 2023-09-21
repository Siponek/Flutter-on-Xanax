import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/features/login/presentation/cubits/login_cubit.dart';
import 'package:todoapp/features/login/data/repositories/authorization_repository.dart';
import 'package:todoapp/features/login/presentation/pages/login_page/widgets/login_button.dart';

const double verticalSpacing = 48;
const String welcomeText = 'Welcome to Flutter on Xanax!';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = '/login';

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
        authorizatonRepository: authorizationRepository,
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
    var parser = EmojiParser();
    var smileEmoji = parser.emojify(':smile:');
    return Center(
      child: Column(
        children: [
          Text(
            welcomeText,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            smileEmoji,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
