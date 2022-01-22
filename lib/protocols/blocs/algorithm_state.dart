part of 'algorithm_bloc.dart';

@freezed
class AlgorithmState with _$AlgorithmState {
  const factory AlgorithmState.loading() = AlgorithmLoadingState;
  const factory AlgorithmState.content({
    required Algorithm algorithm,
    required AlgorithmStep currentStep,
    required LinkedHashMap<DateTime, AlgorithmStep> history,
  }) = AlgorithmContentState;
  const factory AlgorithmState.error({
    required String message,
  }) = AlgorithmErrorState;
}
