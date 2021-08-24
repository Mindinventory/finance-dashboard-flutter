import 'package:bloc/bloc.dart';
import 'package:finance_dashboard/constant/const_value.dart';
import 'package:finance_dashboard/theme/app_theme.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {

  ThemeCubit({required this.isLight}) : super(ThemeInitial());
  bool isLight = true;
  final AppTheme appTheme = AppTheme();

  Future<void> changeTheme(bool isLight) async{
    this.isLight = isLight;
    isLightDarkMode = isLight;
    emit(ThemeChangeState());
  }
}
