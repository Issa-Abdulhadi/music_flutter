import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/domain/entites/sound_entity.dart';
import '../../../utils/app_colors.dart';
import 'bloc/sound_list_bloc.dart';
import 'bloc/sound_list_event.dart';

class SoundItem extends StatelessWidget {
  final SoundEntity soundEntity;
  final int index;
   const SoundItem({Key? key,required this.soundEntity,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: (soundEntity.isSelected ?? false)
          ? AppColors.selectedSoundBgColor
          : AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                context
                    .read<SoundListBloc>()
                    .add(StopAndPlaySoundsEvent(index));
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: soundEntity.isPlaying ?? false
                      ? AppColors.bgPlayingColor
                      : AppColors
                      .bgPauseColor, // You can set any color you want
                ),
                // Your content goes here
                child: Center(
                  child: soundEntity.isPlaying ?? false
                      ? const Icon(
                    Icons.pause,
                    color: AppColors.playingColor,
                  )
                      : const Icon(
                    Icons.play_arrow,
                    color: AppColors.pauseColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  soundEntity.title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  soundEntity.artist!,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "${soundEntity.duration!.inMinutes.remainder(60)}:${(soundEntity.duration!.inSeconds.remainder(60))}",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }
}
