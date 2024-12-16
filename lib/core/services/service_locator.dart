import 'package:get_it/get_it.dart';

import '../../view/auth/login/cubit/login_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ////// Bloc
    sl.registerFactory(() => LoginCubit());
    // sl.registerLazySingleton(() => StaticPagesBloc());
  }
}
