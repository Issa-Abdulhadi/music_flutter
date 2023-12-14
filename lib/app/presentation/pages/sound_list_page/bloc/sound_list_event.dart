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
