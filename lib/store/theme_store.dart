import 'package:fluttertube/services/shared_preferences_service.dart';
import 'package:mobx/mobx.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final SharedPreferencesService _preferencesService;
  @observable
  bool isDarkTheme;

  _ThemeStore(this._preferencesService): isDarkTheme = _preferencesService.isDarkTheme;

  @action
  changeTheme() {
    this.isDarkTheme = !this.isDarkTheme;
    this._preferencesService.themeUser = isDarkTheme;
  }
}
