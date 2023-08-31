import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_selection_state.dart';

class TabSelectionCubit extends Cubit<TabSelectionState> {
  TabSelectionCubit() : super(TabSelectionInitial());

  void update(CollegeTab? tab) {
    emit(TabSelectionUpdated(selectedTab: tab ?? CollegeTab.about));
  }
}

enum CollegeTab { about, hostel, qa, events }
