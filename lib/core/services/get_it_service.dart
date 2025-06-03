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
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register FirebaseAuthService
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // Register FirestoreService as DatabaseService
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  // Register AuthRepo
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  // Register ProductRepo
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      databaseService: getIt<DatabaseService>(),
    ),
  );

  // Register OrderRepo
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  // Register FavoritesRepo
  getIt.registerSingleton<FavoritesRepo>(
    FavoritesRepoImpl(getIt<DatabaseService>()),
  );
}
