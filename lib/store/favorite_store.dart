import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  _FavoriteStore() {
    _init();
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
    await _saveFav();
  }

  Future _init() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getKeys().contains('favorites')) {
      favorites = ObservableList.of(json
          .decode(prefs.getString('favorites'))
          .map<Video>((v) => Video.fromJson(v))
          .toList());
    } else {}
  }

  Future _saveFav() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', json.encode(favorites));
  }
}
