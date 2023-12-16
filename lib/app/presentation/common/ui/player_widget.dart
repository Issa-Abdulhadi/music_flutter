import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_state.dart';
import 'package:music_flutter/app/utils/sound_player.dart';
import '../../../utils/app_colors.dart';
import '../../pages/sound_list_page/bloc/sound_list_bloc.dart';
import '../../pages/sound_list_page/bloc/sound_list_event.dart';

class PlayerWidget extends StatefulWidget {
  final String url;
  final int selectedIndex;

  const PlayerWidget({
    required this.url,
    required this.selectedIndex,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoundListBloc, SoundListState>(
        builder: (context, state) {
          _initStreams(SoundPlayer.instance.audioPlayer);
                  return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.position != null ? state.position!.toString().split('.').first : '00:00',
                    style:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  Slider(
                    onChanged: (value) {
                      final duration = state.duration;
                      if (duration == null) {
                        return;
                      }
                      final position = value * duration.inMilliseconds;
                      SoundPlayer.instance.audioPlayer.seek(Duration(milliseconds: position.round()));
                    },
                    value: (state.position != null &&
                        state.duration != null &&
                        state.position!.inMilliseconds > 0 &&
                        state.position!.inMilliseconds <
                            state.duration!.inMilliseconds)
                        ? state.position!.inMilliseconds /
                        state.duration!.inMilliseconds
                        : 0.0,
                    thumbColor: Colors.white,
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.white,
                  ),
                  Text(
                    state.duration != null ? state.duration?.toString().split('.').first ?? '' : '00:00',
                    style:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
              _buildSoundControllersView(context, widget.selectedIndex,state),
            ],
          );
        });
  }

  void _initStreams(AudioPlayer player) {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      context.read<SoundListBloc>().add(UpdateDurationEvent(duration));
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => context.read<SoundListBloc>().add(UpdatePositionEvent(p)))
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      context.read<SoundListBloc>().add(UpdateDurationEvent(Duration.zero));
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
          context.read<SoundListBloc>().add(UpdatePlayerStateEvent(state));
    });
  }

  Row _buildSoundControllersView(BuildContext context, int index, SoundListState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.skip_previous_sharp,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.fast_rewind,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            context.read<SoundListBloc>().add(StopAndPlaySoundsEvent(index));
          },
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // You can set any color you want
            ),
            // Your content goes here
            child: Center(
              child: state.playerState == PlayerState.playing
                  ? const Icon(
                      Icons.pause,
                      color: Colors.black,
                      size: 40,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 40,
                    ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.fast_forward,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.skip_next,
          color: Colors.white,
          size: 30,
        )
      ],
    );
  }
}
