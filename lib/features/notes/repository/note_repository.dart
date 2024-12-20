import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/api/dio.dart';
import 'package:ioe_hub/features/notes/models/note.dart';

@Injectable()
class NoteRepository {
  final ApiClient _apiClient;

  NoteRepository(this._apiClient);

  Future<List<Note>> getNotes(
    int? semester,
    String? query,
    int? page,
    int? limit,
  ) async {
    try {
      var res = await _apiClient.get(
          "/notes?page=$page&limit=$limit&query=$query&semester=$semester");
      return (res.data as List<dynamic>).map((e) => Note.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Note>> getNotesOfUser(
      int? page, int? limit, String userId) async {
    try {
      var res = await _apiClient
          .get("/notes/user?limit=$limit&page=$page&id=$userId");
      return (res.data as List<dynamic>).map((e) => Note.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> rateNote(String noteId, String rating) async {
    try {
      var res = await _apiClient
          .post("/notes/rate?noteId=$noteId&rating=$rating", {});
      return res.data["message"] as String? ?? "Note rated successfully.";
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"] as String? ?? "Failed to rate note.";
      }
    }
    return "Failed to rate note.";
  }

  Future<String> deleteNote(String noteId) async {
    try {
      var res = await _apiClient.delete("/notes?noteId=$noteId");
      return res.data["message"] as String? ?? "Note deleted successfully.";
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"] as String? ??
            "Failed to delete note.";
      }
      return "Failed to delete note.";
    }
  }

  Future<String> updateNote(Note note) async {
    try {
      var res = await _apiClient.patch("/notes", note.toJson());
      return res.data["message"] as String? ?? "Note updated successfully.";
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"] as String? ??
            "Failed to update note.";
      }
      return "Failed to update note.";
    }
  }

  Future<String> createNote(Note note) async {
    try {
      var res = await _apiClient.post("/notes", note.toJson());
      return res.data["message"] as String? ?? "Note created successfully.";
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"] as String? ??
            "Failed to create note.";
      }
      return "Failed to create note.";
    }
  }
}
