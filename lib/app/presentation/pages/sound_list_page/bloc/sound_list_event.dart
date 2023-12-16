import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';

sealed class SoundListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllSoundsEvent extends SoundListEvent {
  GetAllSoundsEvent();
}

class StopAndPlaySoundsEvent extends SoundListEvent {
  final int index;

  StopAndPlaySoundsEvent(this.index);
}
class UpdatePlayerStateEvent extends SoundListEvent {
  final PlayerState state;

  UpdatePlayerStateEvent(this.state);
}
class UpdateDurationEvent extends SoundListEvent {
  final Duration duration;

  UpdateDurationEvent(this.duration);
}
class UpdatePositionEvent extends SoundListEvent {
  final Duration position;

  UpdatePositionEvent(this.position);
}
