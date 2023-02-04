import 'package:dark_mode/cubits/theme/theme_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/cache_helper.dart';
import '../../di/injection_container.dart' as di;

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit():super(InitThemeState());
  late CacheHelper cacheHelper;
  bool isDark= false;
  String _isDarkKey= 'isDark';
  static ThemeCubit get(context)=>BlocProvider.of(context);

  Future<void> init() async {
    cacheHelper = di.locator<CacheHelper>();
    isDark=cacheHelper.getBoolean(key: _isDarkKey)??false;
    emit(ChangeThemeMode());
  }

  void changeAppTheme(){
      isDark =! isDark;
      cacheHelper.putBoolean(key: _isDarkKey, value: isDark).then((value) {
        emit(ChangeThemeMode());
      });
  }
}