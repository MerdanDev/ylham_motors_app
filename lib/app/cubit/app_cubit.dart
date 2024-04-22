import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/navigation/navigation.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  void updateAppSource(AppSource appSource) {
    emit(state.copyWith(appSource: appSource));
  }

  void updateAppBottomNavigationBarItemType(BottomNavigationBarItemType type) {
    emit(state.copyWith(currentBottomNavigationBarType: type));
  }
}
