import 'dart:async';
import 'dart:developer';

// import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    required StreamController<Exception> exceptionStream,
    // required AnalyticsRepository analyticsRepository,
  }) : _exceptionStream = exceptionStream;
  //  _analyticsRepository = analyticsRepository;

  // final AnalyticsRepository _analyticsRepository;
  final StreamController<Exception> _exceptionStream;

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('onTransition ${bloc.runtimeType}: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (error is Exception) {
      _exceptionStream.add(error);
    }
    log('onError ${bloc.runtimeType}', error: error, stackTrace: stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // final dynamic state = change.nextState;
    // if (state is AnalyticsEventMixin) _analyticsRepository.track(state.event);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    // if (event is AnalyticsEventMixin) _analyticsRepository.track(event.event);
  }
}
