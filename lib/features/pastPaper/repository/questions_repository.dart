import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/api/dio.dart';
import 'package:ioe_hub/features/pastPaper/models/question.dart';

@Injectable()
class QuestionsRepository {
  final ApiClient _apiClient;

  QuestionsRepository(this._apiClient);

  Future<List<Question>> getQuestions(
    String? semester,
    String? query,
    int? page,
    int? limit,
  ) async {
    try {
      var res = await _apiClient.get(
          "/pastpaper?page=$page&limit=$limit&query=$query&semester=$semester");
      return (res.data as List<dynamic>)
          .map((e) => Question.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
