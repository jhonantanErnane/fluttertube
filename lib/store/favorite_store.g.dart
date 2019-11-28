// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  final _$favoritesAtom = Atom(name: '_FavoriteStore.favorites');

  @override
  ObservableList<Video> get favorites {
    _$favoritesAtom.context.enforceReadPolicy(_$favoritesAtom);
    _$favoritesAtom.reportObserved();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<Video> value) {
    _$favoritesAtom.context.conditionallyRunInAction(() {
      super.favorites = value;
      _$favoritesAtom.reportChanged();
    }, _$favoritesAtom, name: '${_$favoritesAtom.name}_set');
  }

  final _$numberOfFavAtom = Atom(name: '_FavoriteStore.numberOfFav');

  @override
  int get numberOfFav {
    _$numberOfFavAtom.context.enforceReadPolicy(_$numberOfFavAtom);
    _$numberOfFavAtom.reportObserved();
    return super.numberOfFav;
  }

  @override
  set numberOfFav(int value) {
    _$numberOfFavAtom.context.conditionallyRunInAction(() {
      super.numberOfFav = value;
      _$numberOfFavAtom.reportChanged();
    }, _$numberOfFavAtom, name: '${_$numberOfFavAtom.name}_set');
  }

  final _$_FavoriteStoreActionController =
      ActionController(name: '_FavoriteStore');

  @override
  void toggleFavorite(Video v) {
    final _$actionInfo = _$_FavoriteStoreActionController.startAction();
    try {
      return super.toggleFavorite(v);
    } finally {
      _$_FavoriteStoreActionController.endAction(_$actionInfo);
    }
  }
}
