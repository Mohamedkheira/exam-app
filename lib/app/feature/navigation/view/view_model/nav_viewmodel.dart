import 'package:bloc/bloc.dart';

import '../cubit/nav_state.dart';

class NavViewmodel extends Cubit<NavState> {
  NavViewmodel() : super(NavState.initial());

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
