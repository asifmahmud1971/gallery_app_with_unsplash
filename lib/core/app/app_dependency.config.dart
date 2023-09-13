// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:unsplash_gallery/core/app/app_dependency.dart' as _i15;
import 'package:unsplash_gallery/core/app/app_preference.dart' as _i3;
import 'package:unsplash_gallery/data/network/api_client.dart' as _i10;
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart'
    as _i14;
import 'package:unsplash_gallery/features/screens/gallery/repository/gallery_repo.dart'
    as _i12;
import 'package:unsplash_gallery/features/screens/gallery/repository/gallery_repo_imp.dart'
    as _i11;
import 'package:unsplash_gallery/features/screens/no_internet/cubit/internet_cubit.dart'
    as _i5;
import 'package:unsplash_gallery/features/screens/test_screen/cubit/test_cubit.dart'
    as _i13;
import 'package:unsplash_gallery/features/screens/test_screen/test_repository/test_repo.dart'
    as _i8;
import 'package:unsplash_gallery/features/screens/test_screen/test_repository/test_repoimpl.dart'
    as _i7;
import 'package:unsplash_gallery/features/screens/theme/cubit/theme_cubit.dart'
    as _i9;

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
  gh.factory<_i7.TestRepoImpl>(() => _i8.TestRepo());
  gh.factory<_i9.ThemeCubit>(() => _i9.ThemeCubit());
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(gh<_i4.Dio>()));
  gh.factory<_i11.GalleryRepositoryImp>(
      () => _i12.GalleryRepository(apiClient: gh<_i10.ApiClient>()));
  gh.factory<_i13.TestCubit>(() => _i13.TestCubit(gh<_i7.TestRepoImpl>()));
  gh.factory<_i14.GalleryCubit>(() => _i14.GalleryCubit(
        gh<_i11.GalleryRepositoryImp>(),
        gh<_i3.AppPreferences>(),
      ));
  return getIt;
}

class _$AppModule extends _i15.AppModule {}
