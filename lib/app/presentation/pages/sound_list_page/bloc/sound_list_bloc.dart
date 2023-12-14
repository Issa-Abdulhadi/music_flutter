import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/domain/entites/sound_entity.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_event.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_state.dart';
import 'package:music_flutter/app/utils/result.dart';
import 'package:music_flutter/app/utils/sound_player.dart';
import '../../../../domain/use_cases/get_sounds_use_case.dart';

class SoundListBloc extends Bloc<SoundListEvent, SoundListState> {
  SoundListBloc({required this.getSoundsUseCase})
      : super(SoundListState(status: SoundListStatus.initial)) {
    on<GetAllSoundsEvent>(_onGetAllSoundsEvent);
    on<StopAndPlaySoundsEvent>(_onStopAndPlaySoundsEvent);
    soundPlayer = SoundPlayer(url: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3");
  }

  GetSoundsUseCase getSoundsUseCase;
  late SoundPlayer soundPlayer;


  void _onGetAllSoundsEvent(
      GetAllSoundsEvent event, Emitter<SoundListState> emitter) async {
    emitter(state.copyWith(status: SoundListStatus.loading));
    final result = await getSoundsUseCase();
    if (result.isSuccess()) {
      emitter(state.copyWith(
          sounds: ((result as Success<List<SoundEntity?>>).value),
          status: SoundListStatus.success));
    } else {
      emitter(state.copyWith(
          errorMessage: (result as Failure).errorMessage,
          status: SoundListStatus.error));
    }
  }

  void _onStopAndPlaySoundsEvent(
      StopAndPlaySoundsEvent event, Emitter<SoundListState> emitter) async {
    if (state.sounds != null) {
      var isPlaying = state.sounds![event.index]?.isPlaying ?? false;

      for (var e in state.sounds!) {
        e?.isPlaying = false;
        e?.isSelected = false;
      }
      state.sounds![event.index]!.isPlaying = !isPlaying;
      if (state.sounds![event.index]!.isPlaying!) {
        soundPlayer.play();
        // Duration? soundDuration = await soundPlayer.audioPlayer.getDuration();
        // Duration? getCurrentPosition = await soundPlayer.audioPlayer.getCurrentPosition();
        // print("soundDuration=${soundDuration!.inSeconds}");
        // print("soundDuration=${getCurrentPosition!.inSeconds}");
      } else {
        soundPlayer.stop();
      }
      state.sounds![event.index]!.isSelected = true;
int selectedItem = Random().nextInt(10);
      emitter(state.copyWith(
          sounds: state.sounds!,selectedItem: selectedItem));
    }
  }
}
