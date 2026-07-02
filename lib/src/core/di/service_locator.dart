import 'package:get_it/get_it.dart';
import 'package:hady_alnabi/src/core/cubit/theme_cubit.dart';
import 'package:hady_alnabi/src/core/router/app_router.dart';

final GetIt getIt = GetIt.instance;

/// Centralizes object lifetimes so feature dependencies remain replaceable.
void setupServiceLocator() {
  if (!getIt.isRegistered<AppRouter>()) {
    getIt.registerLazySingleton<AppRouter>(AppRouter.new);
  }
  if (!getIt.isRegistered<ThemeCubit>()) {
    getIt.registerFactory<ThemeCubit>(ThemeCubit.new);
  }
}
