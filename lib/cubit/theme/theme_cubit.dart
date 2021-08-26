import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../constant/const_value.dart';
import '../../theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required this.isLight}) : super(ThemeInitial());
  bool isLight = true;
  final AppTheme appTheme = AppTheme();

  Future<void> changeTheme(bool isLight) async {
    this.isLight = isLight;
    isLightDarkMode = isLight;
    emit(ThemeChangeState());
  }
}
