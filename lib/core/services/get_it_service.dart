import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo_impl.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo_impl.dart';
import 'package:fruit_hub/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub/core/repos/products_repo/product_repo_impl.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'package:fruit_hub/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:get_it/get_it.dart';

// GetIt service
final getIt = GetIt.instance;
// Register services
void setupGetit() {
  // Register FirebaseAuthService
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // Register FirestoreService
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  // Register AuthRepo
  getIt.registerSingleton<AuthRepo>(
    // Inject FirebaseAuthService and FirestoreService
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    // Inject FirebaseAuthService and FirestoreService
    ProductRepoImpl(
      databaseService: getIt<DatabaseService>(),
    ),
  );
  // Register OrderRepo
  getIt.registerSingleton<OrderRepo>(
    // Inject FirebaseAuthService and FirestoreService
    OrderRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());

getIt.registerSingleton<FavoriteRepo>(
  FavoriteRepoImpl(getIt<DatabaseService>()),
);

getIt.registerFactory(() => FavoritesCubit(getIt<FavoriteRepo>()));



  
}
