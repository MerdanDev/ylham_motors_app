// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

enum AppSource {
  masters,
  store,
}

class AppState extends Equatable {
  const AppState({
    required this.appSource,
    required this.currentBottomNavigationBarType,
  });

  const AppState.initial()
      : this(
          appSource: AppSource.store,
          currentBottomNavigationBarType: BottomNavigationBarItemType.home,
        );

  final AppSource appSource;
  final BottomNavigationBarItemType currentBottomNavigationBarType;

  @override
  List<Object> get props => [
        appSource,
        currentBottomNavigationBarType,
      ];

  AppState copyWith({
    AppSource? appSource,
    BottomNavigationBarItemType? currentBottomNavigationBarType,
  }) {
    return AppState(
      appSource: appSource ?? this.appSource,
      currentBottomNavigationBarType: currentBottomNavigationBarType ?? this.currentBottomNavigationBarType,
    );
  }
}
