import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';
import 'package:tailboard_app/protocols/models/algorithm_transition.dart';

part 'algorithm_event.dart';
part 'algorithm_state.dart';

part 'algorithm_bloc.freezed.dart';

class AlgorithmBloc extends Bloc<AlgorithmEvent, AlgorithmState> {
  AlgorithmBloc() : super(const AlgorithmState.loading()) {
    on<AlgorithmLoaded>((event, emit) {
      AlgorithmStep start = event.algorithm.steps
          .firstWhere((element) => element.id == event.algorithm.start);
      emit(AlgorithmState.content(
        algorithm: event.algorithm,
        currentStep: start,
        history: LinkedHashMap<DateTime, AlgorithmStep>(),
      ));
      _processTransition(start);
    });

    on<AlgorithmTransitioned>((event, emit) {
      if(state is AlgorithmContentState) {
        AlgorithmContentState prev = state as AlgorithmContentState;
        AlgorithmStep next = prev.algorithm.steps
            .firstWhere((element) => element.id == event.transition.to);
        var history = LinkedHashMap<DateTime, AlgorithmStep>.fromIterable(prev.history.entries);
        history[DateTime.now()] = prev.currentStep;
        emit(AlgorithmState.content(
          algorithm: prev.algorithm,
          currentStep: next,
          history: history,
        ));
        _processTransition(next);
      } else {
        add(const AlgorithmEvent.error(message: "Attempted to transition from a non content state."));
      }
    });

    on<AlgorithmError>((event, emit) {
      emit(AlgorithmState.error(message: event.message));
    });
  }

  void _processTransition(AlgorithmStep step) {
    if (step.advance == true) {
      try {
        add(AlgorithmEvent.transition(step.transitions.single));
      } on StateError {
        add(const AlgorithmError(
            message:
                "Attempted automatic transition from a step with an invalid amount of transitions."));
      }
    }
  }
}
