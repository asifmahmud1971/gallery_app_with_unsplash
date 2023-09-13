import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsplash_gallery/core/app/app_dependency.config.dart';

final instance = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  asExtension: false,
)
void configureInjection() => $initGetIt(instance);
@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Dio get dio => Dio();
}
