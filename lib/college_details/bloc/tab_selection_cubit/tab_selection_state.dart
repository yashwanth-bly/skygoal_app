part of 'tab_selection_cubit.dart';

abstract class TabSelectionState extends Equatable {
  const TabSelectionState({this.selectedTab = CollegeTab.about});
  final CollegeTab selectedTab;
  @override
  List<Object> get props => [selectedTab];
}

class TabSelectionInitial extends TabSelectionState {
  @override
  List<Object> get props => [selectedTab];
}

class TabSelectionUpdated extends TabSelectionState {
  const TabSelectionUpdated({super.selectedTab});
  @override
  List<Object> get props => [selectedTab];
}
