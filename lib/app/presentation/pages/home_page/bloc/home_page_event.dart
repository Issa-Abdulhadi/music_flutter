
import 'package:equatable/equatable.dart';

sealed class HomePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeSelectedTabEvent extends HomePageEvent {
  final int selectedIndex;
  ChangeSelectedTabEvent(this.selectedIndex);
}

