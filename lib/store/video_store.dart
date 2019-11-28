import 'package:fluttertube/enums/loading_enum.dart';
import 'package:fluttertube/models/video.dart';
import 'package:mobx/mobx.dart';

import '../api.dart';
part 'video_store.g.dart';

class VideoStore = _VideoStore with _$VideoStore;

abstract class _VideoStore with Store {
  static Api youtubeService = Api();

  @observable
  List<Video> videos = [];

  @observable
  LoadingState loadingState = LoadingState.none;

  @action
  Future onSearch(String search) async {
    loadingState = LoadingState.loading;
    try {
      if (search != null) {
        videos = [];
        videos = await youtubeService.search(search);
      } else {
        videos += await youtubeService.nextPage();
      }

      loadingState = LoadingState.done;
    } catch (e) {
      loadingState = LoadingState.error;
    }
  }
}
