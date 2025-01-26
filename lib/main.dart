import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// this code is added to initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // this code is added to initialize the custom bloc observer
  Bloc.observer = CustomBlocObserver();
  // this code is added to initialize shared preferences
  await SharedPreferencesSingleton.init();
  // this code is added to initialize get_it service
  setupGetit();

  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //this code is added to set the default font family (cairo) for the app
      theme: ThemeData(
        fontFamily: AppTextStyle.fontFamily,
        //this code is added to set the primary color for the app
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      //this code is added to support localization
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,
      //this code to set the default locale to Arabic
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Fruits Hub',
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
