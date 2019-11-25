import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/models/video.dart';

class VideosBloc implements BlocBase {
  Api api;
  List<Video> videos;
  final _videosCtrl = StreamController<List<Video>>();
  Stream get outVideos => _videosCtrl.stream;

  final _searchCtrl = StreamController<String>();
  Sink get inSearch => _searchCtrl.sink;

  VideosBloc() {
    api = Api();
    _searchCtrl.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _videosCtrl.sink.add([]);
      videos = await api.search(search);
    } else {
      videos += await api.nextPage();
    }
    _videosCtrl.sink.add(videos);
  }

  @override
  void dispose() {
    _videosCtrl.close();
    _searchCtrl.close();
  }
}
