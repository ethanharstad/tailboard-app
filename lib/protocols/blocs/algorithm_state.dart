part of 'algorithm_bloc.dart';

@freezed
class AlgorithmState with _$AlgorithmState {
  const factory AlgorithmState.loading() = AlgorithmLoadingState;
  const factory AlgorithmState.content({
    required Algorithm algorithm,
    required AlgorithmStep currentStep,
    @JsonKey(toJson: historyToJson, fromJson: historyFromJson) required LinkedHashMap<DateTime, AlgorithmStep> history,
  }) = AlgorithmContentState;
  const factory AlgorithmState.error({
    required String message,
  }) = AlgorithmErrorState;

  factory AlgorithmState.fromJson(Map<String, dynamic> json) => _$AlgorithmStateFromJson(json);
}

LinkedHashMap<DateTime, AlgorithmStep> historyFromJson(Map<String, dynamic> json) {
  Map<DateTime, AlgorithmStep> typed = {};
  // Convert json to correct objects
  for(var entry in json.entries) {
    typed[DateTime.parse(entry.key)] = AlgorithmStep.fromJson(entry.value);
  }
  LinkedHashMap<DateTime, AlgorithmStep> history = LinkedHashMap<DateTime, AlgorithmStep>();
  // Ensure correct insertion order
  for(var timestamp in typed.keys.sorted((a, b) => a.compareTo(b))) {
    history[timestamp] = typed[timestamp] as AlgorithmStep;
  }
  return history;
}

Map<String, dynamic> historyToJson(LinkedHashMap<DateTime, AlgorithmStep> history) {
  Map<String, dynamic> data = {};
  for (var entry in history.entries) {
    data[entry.key.toIso8601String()] = entry.value.toJson();
  }
  return data;
}
