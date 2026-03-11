import 'package:fruit_hub_e_commerce_app/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_hub_e_commerce_app/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../databases/cach_helper.dart';
import '../repos/orders_repo/orders_repo.dart';
import '../repos/orders_repo/orders_repo_impl.dart';
import '../repos/products_repo/products_repo.dart';
import 'database_service.dart';
import 'firebase_auth_service.dart';

final getit = GetIt.instance;

void setupServicesLocator() {
  getit.registerSingleton<CacheHelper>(CacheHelper());
  getit.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getit.registerSingleton<DatabaseService>(FirestoreService());
  getit.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getit<FirebaseAuthService>(),
      databaseService: getit<DatabaseService>(),
    ),
  );

  //* Products Repo
  getit.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(service: getit.get<DatabaseService>()),
  );

  //* Add Order Repo
  getit.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(service: getit.get<DatabaseService>()),
  );
}
