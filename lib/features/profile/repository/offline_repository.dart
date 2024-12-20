import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/db/sqlite.dart';
import 'package:ioe_hub/core/files/file.dart';
import 'package:ioe_hub/features/profile/models/offline.dart';

@Injectable()
class OfflineRepository {
  final DatabaseHelper _dbHelper;
  final FileHandler _fileHandler;
  OfflineRepository(this._dbHelper, this._fileHandler);

  //get all offline notes

  Future<List<Offline>> getAllOfflineNotes() async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> offlineNotesData = await db.rawQuery('''
      SELECT 
        id,
        name,
        type,
        path,
          fileId
      FROM 
        offline
        where
        type = 'note'
        ;
    ''');

    return offlineNotesData.map((e) => Offline.fromJson(e)).toList();
  }

  //save offline note
  Future<void> saveOfflineNote(Offline note) async {
    final db = await _dbHelper.getDatabase();
    await db.insert(
      'offline',
      note.toJson(),
    );
  }

  //get all offline questions
  Future<List<Offline>> getAllOfflineQuestions() async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> offlineQuestionsData =
        await db.rawQuery('''
      SELECT 
        id,
        name,
        type,
        path,
        fileId
      FROM 
        offline
        where
        type = 'question'
        ;
    ''');
    return offlineQuestionsData.map((e) => Offline.fromJson(e)).toList();
  }

  //save offline question
  Future<void> saveOfflineQuestion(Offline question) async {
    final db = await _dbHelper.getDatabase();
    await db.insert(
      'offline',
      question.toJson(),
    );
  }

  //delete offline note or question
  Future<void> deleteOfflineNote(Offline note) async {
    //delete from file storage too
    _fileHandler.deleteFile(note.path);

    final db = await _dbHelper.getDatabase();
    await db.delete(
      'offline',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteOfflineQuestion(Offline question) async {
    try {
      _fileHandler.deleteFile(question.path);

      final db = await _dbHelper.getDatabase();
      await db.delete(
        'offline',
        where: 'id = ?',
        whereArgs: [question.id],
      );
    } catch (e) {
      rethrow;
    }
  }
}
