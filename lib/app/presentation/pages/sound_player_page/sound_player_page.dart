import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/presentation/common/ui/custom_app_bar.dart';
import 'package:music_flutter/app/presentation/common/ui/player_widget.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_bloc.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_state.dart';
import 'package:music_flutter/gen/assets.gen.dart';
import '../../../domain/entites/sound_entity.dart';
import '../../../utils/app_colors.dart';

class SoundPlayerPage extends StatelessWidget {
  const SoundPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Content();
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Now Playing ",
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
          BlocBuilder<SoundListBloc, SoundListState>(builder: (context, state) {
        if (state.status == SoundListStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == SoundListStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? ""),
          );
        } else if (state.status == SoundListStatus.success) {
          if (state.sounds != null && state.sounds!.isNotEmpty) {
            return _buildPage(context, state);
          } else {
            return const Center(
              child: Text(
                "No Sounds Found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      }),
    );
  }

  Widget _buildPage(BuildContext context, SoundListState state) {
    SoundEntity? selectedSound;
    var index = 0;
    for (index = 0; index < state.sounds!.length; index++) {
      if (state.sounds![index]?.isSelected ?? false) {
        selectedSound = state.sounds![index];
        break;
      }
    }
    if (selectedSound != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          _buildHeaderImage(),
          const SizedBox(
            height: 20,
          ),
          _buildCenterButton(),
          const SizedBox(
            height: 30,
          ),
          _buildLabelWithShadow(selectedSound),
          const SizedBox(
            height: 10,
          ),
          PlayerWidget(url: selectedSound.soundUrl ?? "",selectedIndex: index,),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    }
    return const Center(
        child: Text(
      "No Sound Selected",
      style: TextStyle(color: Colors.white),
    ));
  }

  Stack _buildLabelWithShadow(SoundEntity selectedSound) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              // Adjust the sigma values for the blur effect
              child: Image.asset(
                "assets/sound_bg.png",
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              _buildSoundName(selectedSound),
              const SizedBox(
                height: 10,
              ),
              _buildArtistName(selectedSound),
            ],
          ),
        ),
      ],
    );
  }



  Text _buildArtistName(SoundEntity selectedSound) {
    return Text(
      selectedSound.artist ?? "",
      style: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  Text _buildSoundName(SoundEntity selectedSound) {
    return Text(
      selectedSound.title ?? "",
      style: const TextStyle(
          color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
    );
  }

  Row _buildCenterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 165, height: 39, child: _buildFollowButton()),
        const SizedBox(
          width: 10,
        ),
        SizedBox(width: 165, height: 39, child: _buildShuffleButton()),
      ],
    );
  }

  ElevatedButton _buildFollowButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        // Set text color to white
        side: const BorderSide(color: Colors.white, width: 2),
        // Set white border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Set border radius
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 16), // Set padding
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            color: Colors.white, // Set icon color to white
          ),
          SizedBox(width: 8), // Add spacing between icon and text
          Text(
            'FOLLOW',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildShuffleButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shuffle,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            'SHUFFLE PLAY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildHeaderImage() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  offset: const Offset(0, -50),
                  blurRadius: 100,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Center(child: Assets.soundWave.image(height: 100)),
          ),
          Center(
              child: Image.asset(
            "assets/sound_bg.png",
          )),
        ],
      ),
    );
  }
}
