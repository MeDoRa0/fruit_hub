import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:fruit_hub/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    // BlocProvider for LoginCubit
    return BlocProvider(
      // Create an instance of LoginCubit
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
