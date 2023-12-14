import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/domain/entites/sound_entity.dart';
import 'package:music_flutter/app/presentation/pages/home_page/bloc/home_page_bloc.dart';
import 'package:music_flutter/app/presentation/pages/home_page/bloc/home_page_event.dart';
import 'package:music_flutter/app/presentation/pages/home_page/bloc/home_page_state.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_state.dart';
import 'package:music_flutter/app/presentation/pages/sound_player_page/sound_player_page.dart';
import 'package:music_flutter/app/utils/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../sound_list_page/bloc/sound_list_bloc.dart';
import '../sound_list_page/bloc/sound_list_event.dart';
import 'home_page_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Content();
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _HomePageState();
}

class _HomePageState extends State<_Content>
    with SingleTickerProviderStateMixin {
  double _lineWidth = 15;
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
        builder: (builderContext, state) => Scaffold(
              backgroundColor: AppColors.backgroundColor,
              bottomNavigationBar: Stack(
                children: [
                  BottomNavigationBar(
                    items: _buildNavigationItems(),
                    backgroundColor: AppColors.backgroundColor,
                    currentIndex: state.selectedTabIndex,
                    onTap: (i) {
                      context.read<HomePageBloc>().add(ChangeSelectedTabEvent(i));
                      if(i==2) {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SoundPlayerPage()),
                      );
                      }
                    },
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width / 5,
                    bottom: 6,
                    onEnd: () {
                      _lineWidth = 15;
                    },
                    left: MediaQuery.of(context).size.width /
                        5 *
                        state.selectedTabIndex,
                    child: Center(
                      child: Container(
                        height: 3,
                        width: _lineWidth,
                        color:
                            AppColors.primary, // Customize the color as needed
                      ),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  HomePageRouter.homePageRouters[state.selectedTabIndex]!,
                  BlocBuilder<SoundListBloc,SoundListState>(builder:(context,state) =>
                  _buildSoundPlayerView(context,state),
                  ),
                ],
              ),
            ));
  }

  Widget _buildSoundPlayerView(BuildContext context, SoundListState state) {
    if(state.sounds != null && state.sounds!.isNotEmpty) {
      SoundEntity? selectedSound ;
      var index=0;
      for (index = 0 ;index< state.sounds!.length;index++) {
        if(state.sounds![index]?.isSelected ?? false) {
          selectedSound=state.sounds![index];
          break;
        }
      }
      if (selectedSound != null) {
        return Positioned(
          bottom: 0,
          child: Theme(
            data: Theme.of(context)
                .copyWith(dialogBackgroundColor: Colors.transparent),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SoundPlayerPage()),
                );
              },
              child: Container(
                color: AppColors.soundBgColor.withOpacity(0.99),
                height: 76,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(selectedSound.artistImage??"",width: 50,height: 50,),
                          ),
                          Text(
                            selectedSound.title ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                           InkWell(
                             onTap: (){
                               context.read<SoundListBloc>().add(StopAndPlaySoundsEvent(index));
                             },
                             child: Icon(
                               (selectedSound.isPlaying ?? false) ?Icons.pause:Icons.play_arrow,
                              color: Colors.white,
                              size: 35,
                          ),
                           ),
                          const Icon(Icons.skip_next,
                              color: Colors.white, size: 35),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary,
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      child: const Divider(
                        color: AppColors.primary,
                        thickness: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
        return Container();
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        backgroundColor: AppColors.backgroundColor,
        icon: Assets.icHome.svg(),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColors.backgroundColor,
        icon: Assets.icSearch.svg(),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColors.backgroundColor,
        icon: Container(
          width: 45.0,
          height: 45.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary, // You can set any color you want
          ),
          // Your content goes here
          child: const Center(
            child: Icon(Icons.headphones),
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColors.backgroundColor,
        icon: Assets.icFlow.svg(),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColors.backgroundColor,
        icon: Assets.icSettings.svg(),
        label: '',
      ),
      // Add more items as needed
    ];
  }
}
