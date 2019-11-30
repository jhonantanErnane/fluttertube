import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final String _favoritesKey = 'favorites';
  final SharedPreferences _sharedPreferences;

  const SharedPreferencesService(this._sharedPreferences);

  set saveFavorites(ObservableList videos) {
    _sharedPreferences.setString(_favoritesKey, json.encode(videos));
  }

  ObservableList<Video> get favorites {
    return ObservableList.of(json
        .decode(_sharedPreferences.getString('favorites'))
        .map<Video>((v) => Video.fromJson(v))
        .toList()) ?? ObservableList<Video>();
  }
}