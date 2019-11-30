import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String title;
  final String thumb;
  final String channel;

  Video({this.id, this.title, this.thumb, this.channel});

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        thumb: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelTitle'],
      );
    } else {
      return Video(
        id: json['videoId'],
        title: json['title'],
        thumb: json['thumb'],
        channel: json['channel'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {'videoId': id, 'title': title, 'thumb': thumb, 'channel': channel};
  }

  @override
  List<Object> get props => [id, title, thumb, channel];
}
