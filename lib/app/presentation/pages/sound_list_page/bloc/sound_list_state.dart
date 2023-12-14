import 'package:equatable/equatable.dart';

import '../../../../domain/entites/sound_entity.dart';

enum SoundListStatus { initial, loading, success, error }

class SoundListState extends Equatable {
  List<SoundEntity?>? sounds;
  String? errorMessage;
  SoundListStatus? status;
  int? selectedItem;


  SoundListState({this.sounds, this.errorMessage, this.status,this.selectedItem});

  SoundListState copyWith(
      {List<SoundEntity?>? sounds,
      String? errorMessage,
      int? selectedItem,
      SoundListStatus? status}) {
    return SoundListState(
        sounds: sounds ?? this.sounds,
        errorMessage: errorMessage ?? this.errorMessage,
        selectedItem: selectedItem ?? this.selectedItem,

        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [sounds, errorMessage, status,selectedItem];
}
