import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the cart repository failures
abstract class SliderFailure with EquatableMixin implements Exception {
  const SliderFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetSliderListFailure extends SliderFailure {
  const GetSliderListFailure(super.error);
}

class SliderRepository {
  const SliderRepository({
    required SliderClient sliderClient,
  }) : _sliderClient = sliderClient;

  final SliderClient _sliderClient;

  Future<SliderListResponse> getSliders() async {
    try {
      return await _sliderClient.getSliders();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetSliderListFailure(error), stackTrace);
    }
  }
}
