// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoStore on _VideoStore, Store {
  final _$videosAtom = Atom(name: '_VideoStore.videos');

  @override
  List<Video> get videos {
    _$videosAtom.context.enforceReadPolicy(_$videosAtom);
    _$videosAtom.reportObserved();
    return super.videos;
  }

  @override
  set videos(List<Video> value) {
    _$videosAtom.context.conditionallyRunInAction(() {
      super.videos = value;
      _$videosAtom.reportChanged();
    }, _$videosAtom, name: '${_$videosAtom.name}_set');
  }

  final _$loadingStateAtom = Atom(name: '_VideoStore.loadingState');

  @override
  LoadingState get loadingState {
    _$loadingStateAtom.context.enforceReadPolicy(_$loadingStateAtom);
    _$loadingStateAtom.reportObserved();
    return super.loadingState;
  }

  @override
  set loadingState(LoadingState value) {
    _$loadingStateAtom.context.conditionallyRunInAction(() {
      super.loadingState = value;
      _$loadingStateAtom.reportChanged();
    }, _$loadingStateAtom, name: '${_$loadingStateAtom.name}_set');
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch(String search) {
    return _$onSearchAsyncAction.run(() => super.onSearch(search));
  }
}
