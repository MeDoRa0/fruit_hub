import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

// GetIt service
final getIt = GetIt.instance;
// Register services
void setupGetit() {
  // Register FirebaseAuthService
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // Register AuthRepo
  getIt.registerSingleton<AuthRepo>(
    // Inject FirebaseAuthService
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
