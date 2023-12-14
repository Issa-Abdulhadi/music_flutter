import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/presentation/common/ui/custom_app_bar.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_bloc.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_state.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/sound_item.dart';
class SoundListPage extends StatelessWidget {
  const SoundListPage({super.key});

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
      appBar: CustomAppBar(title: "All Sound",),
      body: BlocBuilder<SoundListBloc, SoundListState>(
          builder: (context, state) {
        if (state.status == SoundListStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == SoundListStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? ""),
          );
        } else if (state.status == SoundListStatus.success) {
          if (state.sounds != null && state.sounds!.isNotEmpty) {
            return  ListView.builder(
                itemCount: state.sounds!.length,
                itemBuilder: (context, index) {
                  return SoundItem(soundEntity: state.sounds![index]! , index: index);
                },
            );
          } else {
            return const Center(
              child: Text("No Sounds Found"),
            );
          }
        } else {
          return Container();
        }
      }),
    );
  }
}
