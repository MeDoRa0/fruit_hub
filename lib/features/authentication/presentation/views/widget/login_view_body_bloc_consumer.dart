import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/login_view_body.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is LoginFailuer) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
