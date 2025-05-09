import 'package:pharmacy_app/core/repos/product_repo.dart';
import 'package:pharmacy_app/core/repos/product_repo_impl.dart';
import 'package:pharmacy_app/core/services/data_base_supabase.dart';
import 'package:pharmacy_app/core/services/supabse_store.dart';
import 'package:pharmacy_app/feature/auth/data/repos/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // SupabaseClient
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);

  // SupabaseStore
  getIt.registerSingleton<DataBaseSupabase>(SupabseStore());

  // AuthRepository With Supabase
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(getIt<SupabaseClient>()),
  );

  // ProductRepo
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(getIt<DataBaseSupabase>()),
  );
}
