import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entites/sound_entity.dart';

enum SoundListStatus { initial, loading, success, error }

class SoundListState extends Equatable {
  List<SoundEntity?>? sounds;
  String? errorMessage;
  SoundListStatus? status;
  int? selectedItem;
  int? selectedItem2;
  PlayerState? playerState;
  Duration? duration;
  Duration? position;

  SoundListState(
      {this.sounds,
      this.errorMessage,
      this.status,
      this.selectedItem,
      this.selectedItem2,
      this.playerState,
      this.duration,
      this.position});

  SoundListState copyWith(
      {List<SoundEntity?>? sounds,
      String? errorMessage,
      Duration? duration,
      Duration? position,
      int? selectedItem,
      int? selectedItem2,
      PlayerState? playerState,
      SoundListStatus? status}) {
    return SoundListState(
        sounds: sounds ?? this.sounds,
        duration: duration ?? this.duration,
        position: position ?? this.position,
        playerState: playerState ?? this.playerState,
        errorMessage: errorMessage ?? this.errorMessage,
        selectedItem: selectedItem ?? this.selectedItem,
        selectedItem2: selectedItem2 ?? this.selectedItem2,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [
        sounds,
        errorMessage,
        status,
        selectedItem,
    selectedItem2,
        playerState,
        duration,
        position
      ];
}
