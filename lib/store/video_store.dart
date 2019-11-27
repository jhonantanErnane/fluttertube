import 'package:fluttertube/models/video.dart';
import 'package:mobx/mobx.dart';

import '../api.dart';
part 'video_store.g.dart';

class VideoStore = _VideoStore with _$VideoStore;

abstract class _VideoStore with Store {
  static Api youtubeService = Api();
  @observable
  List<Video> videos = [];

  @action
  Future onSearch(String search) async {
if (search != null) {
      videos = [];
      videos = await youtubeService.search(search);
    } else {
      videos += await youtubeService.nextPage();
    }
  }
}