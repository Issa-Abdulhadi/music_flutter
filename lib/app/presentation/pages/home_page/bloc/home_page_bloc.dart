import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_flutter/app/presentation/pages/home_page/bloc/home_page_event.dart';
import 'package:music_flutter/app/presentation/pages/home_page/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState(0)) {
    on<ChangeSelectedTabEvent>(_onChangeSelectedTabEvent);
  }

  void _onChangeSelectedTabEvent(
      ChangeSelectedTabEvent event, Emitter<HomePageState> emitter) async {
    emitter(HomePageState(event.selectedIndex));
  }
}
