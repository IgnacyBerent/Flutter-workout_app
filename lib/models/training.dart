import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_app/models/exercise.dart';

enum Split {
  I,
  II,
  III,
  IV,
  V,
  VI,
  VII,
}

class Training {
  final String date;
  final String split;
  final List<Exercise> exercises;

  Training({
    required this.date,
    required this.split,
    required this.exercises,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'split': split.toString(),
      'exercises': exercises,
    };
  }

  factory Training.fromMap(Map<String, dynamic> map) {
    return Training(
      date: map['date'] as String,
      split: map['split'] as String,
      exercises: List<Exercise>.from(
        (map['exercises'] as List<int>).map<Exercise>(
          (x) => Exercise.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  static Future<Training> fromSnapshot(DocumentSnapshot<Object?> doc) async {
    final exercisesSnap = await doc.reference.collection('exercises').get();
    final exercises = exercisesSnap.docs
        .map((doc) => Exercise.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    return Training(
      date: doc['date'] as String,
      split: doc['split'] as String,
      exercises: exercises,
    );
  }
}
