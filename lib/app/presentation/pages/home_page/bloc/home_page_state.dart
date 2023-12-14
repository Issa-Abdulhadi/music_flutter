import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  int selectedTabIndex;

  HomePageState(this.selectedTabIndex);

  @override
  List<Object?> get props => [selectedTabIndex];
}
