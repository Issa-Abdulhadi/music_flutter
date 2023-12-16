import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/domain/entites/sound_entity.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_event.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_state.dart';
import 'package:music_flutter/app/utils/result.dart';
import '../../../../domain/use_cases/get_sounds_use_case.dart';
import '../../../../utils/sound_player.dart';

class SoundListBloc extends Bloc<SoundListEvent, SoundListState> {
  SoundListBloc({required this.getSoundsUseCase})
      : super(SoundListState(status: SoundListStatus.initial)) {
    on<GetAllSoundsEvent>(_onGetAllSoundsEvent);
    on<StopAndPlaySoundsEvent>(_onStopAndPlaySoundsEvent);
    on<UpdatePlayerStateEvent>(_onUpdatePlayerStateEvent);
    on<UpdatePositionEvent>(_onUpdatePositionEvent);
    on<UpdateDurationEvent>(_onUpdateDurationEvent);
    state.playerState = PlayerState.stopped;
  }

  GetSoundsUseCase getSoundsUseCase;

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

  void _onUpdatePlayerStateEvent(
      UpdatePlayerStateEvent event, Emitter<SoundListState> emitter) async {
    emitter(state.copyWith(playerState: event.state));
  }

  void _onUpdatePositionEvent(
      UpdatePositionEvent event, Emitter<SoundListState> emitter) async {
    emitter(state.copyWith(position: event.position));
  }

  void _onUpdateDurationEvent(
      UpdateDurationEvent event, Emitter<SoundListState> emitter) async {
    emitter(state.copyWith(duration: event.duration));
  }

  void _onStopAndPlaySoundsEvent(
      StopAndPlaySoundsEvent event, Emitter<SoundListState> emitter) async {
    if (state.sounds != null) {
      var isPlaying = state.sounds![event.index]?.isPlaying ?? false;
      for (var e in state.sounds!) {
        e?.isPlaying = false;
        e?.isSelected = false;
      }
      if (state.selectedItem == event.index) {
        await _handleSameItem(event, emitter, isPlaying);
      } else {
        await _handleAnotherItem(event, emitter, isPlaying);
      }
      state.sounds![event.index]!.isSelected = true;
      int selectedItem = event.index;
      int selectedItem2 = Random().nextInt(10);
      emitter(state.copyWith(
          sounds: state.sounds!,
          selectedItem: selectedItem,
          selectedItem2: selectedItem2));
    }
  }

  Future<void> _handleSameItem(StopAndPlaySoundsEvent event,
      Emitter<SoundListState> emitter, bool isPlaying) async {
    if (isPlaying) {
      await SoundPlayer.instance.pause();
      state.playerState = PlayerState.paused;
      state.sounds![event.index]!.isPlaying = false;
    } else {
      SoundPlayer.instance.resume();
      state.playerState = PlayerState.playing;
      state.sounds![event.index]!.isPlaying = true;
    }
  }

  Future<void> _handleAnotherItem(StopAndPlaySoundsEvent event,
      Emitter<SoundListState> emitter, bool isPlaying) async {
    if (isPlaying) {
      await SoundPlayer.instance.stop();
      state.playerState = PlayerState.stopped;
      state.sounds![state.selectedItem!]!.isPlaying = false;
      await SoundPlayer.instance.play(state.sounds![event.index]!.soundUrl!);
      Duration? position =
          await SoundPlayer.instance.audioPlayer.getCurrentPosition();
      Duration? duration = await SoundPlayer.instance.audioPlayer.getDuration();
      emitter(state.copyWith(position: position, duration: duration));
      state.sounds![event.index]!.isPlaying = true;
    } else {
      await SoundPlayer.instance.play(state.sounds![event.index]!.soundUrl!);
      Duration? position = await SoundPlayer.instance.audioPlayer.getCurrentPosition();
      Duration? duration = await SoundPlayer.instance.audioPlayer.getDuration();
      state.playerState = PlayerState.playing;
      state.sounds![event.index]!.isPlaying = true;
      emitter(state.copyWith(position: position, duration: duration));
    }
  }
}
