import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

const API_KEY = 'AIzaSyDcGHtVjvKbIxpMFMhGBgXNE8j6QM498ZQ';

class Api {
  String _search;
  String _nextToken;

  Future<ObservableList<Video>> search(String search) async {
    _search = search;

    http.Response response = await http.get(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10');

    return _decode(response);
  }

  Future<ObservableList<Video>> nextPage() async {
    http.Response response = await http.get(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken');

    return _decode(response);
  }

  ObservableList<Video> _decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      _nextToken = decoded['nextPageToken'];

      try {
        ObservableList<Video> videos =
            ObservableList.of(decoded['items'].map<Video>((map) {
          return Video.fromJson(map);
        }).toList());
        return videos;
      } catch (e) {
        throw Exception('Failed to load videos');
      }
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
