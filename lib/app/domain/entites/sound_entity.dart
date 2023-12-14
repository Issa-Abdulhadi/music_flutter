import 'package:equatable/equatable.dart';
import 'package:music_flutter/app/data/models/sound_model.dart';

class SoundEntity extends Equatable {
  String? title;
  String? artist;
  Duration? duration;
  String? artistImage;
  bool? isPlaying;
  bool? isFavorite;
  bool? isSelected=false;
  SoundEntity({
    required this.title,
    required this.artist,
    required this.duration,
    this.artistImage,
    this.isPlaying ,
    this.isSelected ,
    this.isFavorite,
  }) :super();




  SoundEntity.from(SoundModel model) {
    title = model.title;
    artist = model.artist;
    isPlaying = false;
    isFavorite = false;
    isSelected = false;
    duration = Duration(seconds: model.durationInSeconds ?? 0);
    artistImage = model.artistImage;
  }

  @override
  List<Object?> get props => [
        title,
        artist,
        duration,
        artistImage,
        isPlaying,
        isFavorite,
    isSelected,
      ];
  @override
  int get hashCode =>
      title.hashCode ^
      artist.hashCode ^
      duration.hashCode ^
      artistImage.hashCode ^
      isPlaying.hashCode ^
      isSelected.hashCode ^
      isFavorite.hashCode;





}
