import 'package:chat_gpt/core/theme/theme_cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(InitState());

  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isLight = false;

  void changeTheme() {
    isLight = !isLight;
    emit(ChangeThemeState());
  }
}
