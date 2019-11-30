// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  Computed<int> _$numberOfFavComputed;

  @override
  int get numberOfFav =>
      (_$numberOfFavComputed ??= Computed<int>(() => super.numberOfFav)).value;

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

  final _$toggleFavoriteAsyncAction = AsyncAction('toggleFavorite');

  @override
  Future toggleFavorite(Video v) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(v));
  }
}
