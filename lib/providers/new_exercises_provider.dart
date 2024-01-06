import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/models/exercise_base.dart';

class ExerciseNotifier extends StateNotifier<List<Exercise>> {
  ExerciseNotifier() : super([]);

  void addExercise(Exercise exercise) {
    state = [...state, exercise];
  }

  void removeExercise(Exercise exercise) {
    state = state.where((e) => e != exercise).toList();
  }

  void updateExercise(Exercise exercise) {
    state = [
      for (final e in state)
        if (e == exercise) exercise else e
    ];
  }

  void clear() {
    state = [];
  }
}

final exerciseProvider =
    StateNotifierProvider<ExerciseNotifier, List<Exercise>>(
        (ref) => ExerciseNotifier());
