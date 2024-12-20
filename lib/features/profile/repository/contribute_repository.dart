import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/profile/models/contribute.dart';

@Injectable()
class QuestionRepository {
  final List<QuestionContribution> _questions = [];

  // Fake submission endpoint
  Future<void> submitQuestion({
    required String question,
    required String faculty,
    required int year,
    required int semester,
  }) async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));

    // Creating a new QuestionContribution
    final questionContribution = QuestionContribution(
      question: question,
      faculty: faculty,
      year: year,
      semester: semester,
    );

    // Adding the question contribution to the list
    _questions.add(questionContribution);
  }

  // Fake fetch endpoint (optional, to view the submitted questions)
  Future<List<QuestionContribution>> fetchQuestions() async {
    await Future.delayed(const Duration(seconds: 2));
    return _questions;
  }
}
