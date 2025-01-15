import 'package:flutter/material.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:fruit_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/signup_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
  // Get the AuthRepo instance
    return BlocProvider(
      create: (context) => SignupCubit(
        // Inject AuthRepo
       getIt<AuthRepo>(),
      ),
      // SignupView
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: const SignupViewBody(),
      ),
    );
  }
}
