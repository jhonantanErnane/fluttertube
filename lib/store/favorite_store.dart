import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/services/shared_preferences_service.dart';
import 'package:mobx/mobx.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  final SharedPreferencesService _preferencesServices;
  _FavoriteStore(this._preferencesServices) {
    favorites = _preferencesServices.favorites;
  }

  @observable
  ObservableList<Video> favorites = ObservableList<Video>();

  @computed
  int get numberOfFav => favorites.length;

  @action
  Future toggleFavorite(Video v) async {
    if (favorites.contains(v)) {
      favorites.remove(v);
    } else {
      favorites.add(v);
    }
    _preferencesServices.saveFavorites = favorites;
  }

}
