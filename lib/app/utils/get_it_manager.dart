import 'package:get_it/get_it.dart';
import 'package:music_flutter/app/data/repository/fake_impl/fake_sound_repository_impl.dart';
import 'package:music_flutter/app/data/repository/sound_repository.dart';
import 'package:music_flutter/app/domain/use_cases/get_sounds_use_case.dart';
import 'package:music_flutter/app/presentation/pages/sound_list_page/bloc/sound_list_bloc.dart';

import '../presentation/pages/home_page/bloc/home_page_bloc.dart';

final getIt = GetIt.instance;

//T get<T extends Object>() => getIt.get<T>();

class GetItManager {
  GetItManager.init() {
    SoundRepository soundRepository = FakeSoundRepositoryImpl();
    GetSoundsUseCase getSoundsUseCase = GetSoundsUseCase(soundRepository: soundRepository);
    SoundListBloc soundListBloc=SoundListBloc(getSoundsUseCase: getSoundsUseCase);
    HomePageBloc homePageBloc = HomePageBloc();
    getIt.registerFactory<SoundListBloc>(() => soundListBloc);
    getIt.registerFactory<HomePageBloc>(() => homePageBloc);
    getIt.registerFactory<SoundRepository>(() => soundRepository);
    getIt.registerFactory<GetSoundsUseCase>(() => getSoundsUseCase);
  }
}
