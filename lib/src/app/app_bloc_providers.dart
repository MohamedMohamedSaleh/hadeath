import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hady_alnabi/src/core/cubit/theme_cubit.dart';
import 'package:hady_alnabi/src/core/di/service_locator.dart';

abstract final class AppBlocProviders {
  static List<BlocProvider<dynamic>> get providers => <BlocProvider<dynamic>>[
    BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
  ];
}
