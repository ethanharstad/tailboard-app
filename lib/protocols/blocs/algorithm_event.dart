part of 'algorithm_bloc.dart';

@freezed
class AlgorithmEvent with _$AlgorithmEvent {
  const factory AlgorithmEvent.loaded({required Algorithm algorithm}) = AlgorithmLoaded;
  const factory AlgorithmEvent.transition(AlgorithmTransition transition) = AlgorithmTransitioned;
  const factory AlgorithmEvent.error({
    required String message,
  }) = AlgorithmError;
}
