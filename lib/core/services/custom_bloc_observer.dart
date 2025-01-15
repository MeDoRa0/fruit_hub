import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

// CustomBlocObserver class extends BlocObserver class
class CustomBlocObserver extends BlocObserver {
  // Overriding the onEvent method to print the event
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      log('Event: ${bloc.runtimeType}, $event');
    }
  }
  // Overriding the onChange method to print the change

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Check if the app is in debug mode
    if (kDebugMode) {
      // Print the change
      log('Change: ${bloc.runtimeType}, $change');
    }
  }

// Overriding the onTransition method to print the transition
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    if (kDebugMode) {
      // Print the transition

      log('Transition: ${bloc.runtimeType}, $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      // Print the error
      debugPrint('Error: ${bloc.runtimeType}, $error, $stackTrace');
    }
  }
}
