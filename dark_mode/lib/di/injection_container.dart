import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/cache_helper.dart';

final locator = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  final cacheHelper =  CacheHelper(sharedPreferences: locator());
  locator.registerLazySingleton(() => cacheHelper);
}
