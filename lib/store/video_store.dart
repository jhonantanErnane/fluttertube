import 'package:fluttertube/enums/loading_enum.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/services/api.dart';
import 'package:mobx/mobx.dart';

part 'video_store.g.dart';

class VideoStore = _VideoStore with _$VideoStore;

abstract class _VideoStore with Store {
  static Api youtubeService = Api();

  @observable
  ObservableList<Video> videos = ObservableList<Video>();

  @observable
  LoadingState loadingState = LoadingState.none;

  @action
  Future<void> onSearch(String search) async {
    try {
      if (search != null) {
        loadingState = LoadingState.loading;
        videos = ObservableList<Video>();
        videos = ObservableList.of(await youtubeService.search(search));
      } else {
        videos.addAll(ObservableList.of(await youtubeService.nextPage()));
      }

      loadingState = LoadingState.done;
    } catch (e) {
      loadingState = LoadingState.error;
    }
  }
}
