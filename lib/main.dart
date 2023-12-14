import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/data/repository/fake_impl/fake_sound_repository_impl.dart';
import 'package:music_flutter/app/data/repository/sound_repository.dart';
import 'package:music_flutter/app/domain/use_cases/get_sounds_use_case.dart';
import 'package:music_flutter/app/presentation/pages/home_page/home_page.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_event.dart';
import 'package:music_flutter/app/utils/app_colors.dart';
import 'package:music_flutter/app/utils/get_it_manager.dart';

import 'app/presentation/pages/home_page/bloc/home_page_bloc.dart';
import 'app/presentation/pages/sound_list_page/bloc/sound_list_bloc.dart';

Future<void> main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetItManager.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SoundRepository>(
            create: (_) => getIt<SoundRepository>()),
        RepositoryProvider<GetSoundsUseCase>(
            create: (_) => getIt<GetSoundsUseCase>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<HomePageBloc>(),
          ),
          BlocProvider(
              create: (context) =>
                  getIt<SoundListBloc>()..add(GetAllSoundsEvent())),
        ],
        child: MaterialApp(
          title: 'Sound App',
          theme: ThemeData(
            primaryColor: AppColors.primary,
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary)
                .copyWith(background: AppColors.backgroundColor),
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
