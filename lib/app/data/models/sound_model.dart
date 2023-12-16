
import 'package:equatable/equatable.dart';

class SoundModel extends Equatable {
  String? title;
  String? artist;
  int? durationInSeconds;
  String? artistImage;
  String? bgImage;
  String? soundUrl;

  SoundModel({
    required this.title,
    required this.artist,
    required this.soundUrl,
    required this.durationInSeconds,
    this.artistImage,
  });

  SoundModel.fromJson(dynamic json) {
    title = json['title'] as String;
    artist = json['artist'] as String;
    soundUrl = json['soundUrl'] as String;
    durationInSeconds = json['duration'] as int;
    artistImage = json['artistImage'] as String;
    artistImage = json['bgImage'] as String;
  }

  @override
  List<Object?> get props => [
        title,
        artist,
        durationInSeconds,
        artistImage,
        bgImage,
        soundUrl,
      ];
}
