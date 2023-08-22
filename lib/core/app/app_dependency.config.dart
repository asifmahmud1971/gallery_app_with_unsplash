// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:terminator/core/app/app_dependency.dart' as _i21;
import 'package:terminator/core/app/app_preference.dart' as _i3;
import 'package:terminator/data/network/api_client.dart' as _i8;
import 'package:terminator/features/screens/auth/cubit/auth_cubit.dart' as _i17;
import 'package:terminator/features/screens/auth/repository/auth_repo.dart'
    as _i10;
import 'package:terminator/features/screens/auth/repository/auth_repo_imp.dart'
    as _i9;
import 'package:terminator/features/screens/dashboard/cubit/dashboard_cubit.dart'
    as _i18;
import 'package:terminator/features/screens/dashboard/repository/dashboard_repo.dart'
    as _i12;
import 'package:terminator/features/screens/dashboard/repository/dashboard_repo_imp.dart'
    as _i11;
import 'package:terminator/features/screens/no_internet/cubit/internet_cubit.dart'
    as _i5;
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart'
    as _i19;
import 'package:terminator/features/screens/termine/repository/termin_repo.dart'
    as _i16;
import 'package:terminator/features/screens/termine/repository/termin_repo_imp.dart'
    as _i15;
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart'
    as _i20;
import 'package:terminator/features/screens/termine_details/repository/termin_details_repo.dart'
    as _i14;
import 'package:terminator/features/screens/termine_details/repository/termin_details_repo_imp.dart'
    as _i13;
import 'package:terminator/features/screens/theme/cubit/theme_cubit.dart'
    as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.AppPreferences>(() => _i3.AppPreferences());
  gh.factory<_i4.Dio>(() => appModule.dio);
  gh.factory<_i5.InternetCubit>(() => _i5.InternetCubit());
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i7.ThemeCubit>(() => _i7.ThemeCubit());
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(gh<_i4.Dio>()));
  gh.factory<_i9.AuthRepositoryImp>(
      () => _i10.AuthRepository(apiClient: gh<_i8.ApiClient>()));
  gh.factory<_i11.DashboardRepositoryImp>(
      () => _i12.DashboardRepository(apiClient: gh<_i8.ApiClient>()));
  gh.factory<_i13.TerminDetailsImp>(
      () => _i14.TerminDetailsRepository(apiClient: gh<_i8.ApiClient>()));
  gh.factory<_i15.TerminRepositoryImp>(
      () => _i16.TerminRepository(apiClient: gh<_i8.ApiClient>()));
  gh.factory<_i17.AuthCubit>(() => _i17.AuthCubit(gh<_i9.AuthRepositoryImp>()));
  gh.factory<_i18.DashboardCubit>(() => _i18.DashboardCubit(
        gh<_i11.DashboardRepositoryImp>(),
        gh<_i3.AppPreferences>(),
      ));
  gh.factory<_i19.TerminCubit>(() => _i19.TerminCubit(
        gh<_i15.TerminRepositoryImp>(),
        gh<_i3.AppPreferences>(),
      ));
  gh.factory<_i20.TerminDetailsCubit>(
      () => _i20.TerminDetailsCubit(gh<_i13.TerminDetailsImp>()));
  return getIt;
}

class _$AppModule extends _i21.AppModule {}
