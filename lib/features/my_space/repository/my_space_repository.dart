// my_space_repository.dart
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/di/modules/shared_preferences.dart';
import 'package:ioe_hub/features/syllabus/models/faculty.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

@Injectable()
class MySpaceRepository {
  final AppSharedPreferences _prefs;
  final FacultyRepository _facultyRepository;

  MySpaceRepository(this._prefs, this._facultyRepository);

  // Save current faculty and semester details
  Future<void> saveCurrentSpace(Faculty faculty, Semester semester) async {
    await _prefs.saveString('selectedFaculty', jsonEncode(faculty));
    await _prefs.saveString('selectedSemester', jsonEncode(semester));
  }

  // Get current faculty ID
  Future<Faculty?> getCurrentFaculty() async {
    var res = await _prefs.getString('selectedFaculty');
    return res != null ? Faculty.fromJson(jsonDecode(res)) : null;
  }

  // Get current semester ID
  Future<Semester?> getCurrentSemester() async {
    var res = await _prefs.getString('selectedSemester');
    return res != null ? Semester.fromJson(jsonDecode(res)) : null;
  }

  // Fetch all faculties
  Future<List<Faculty>> getAllFaculties() async {
    return await _facultyRepository.getAllFaculties();
  }

  // Fetch all semesters for a given faculty
  Future<List<Semester>> getAllSemesters(int facultyId) async {
    return await _facultyRepository.getAllSemesters(facultyId);
  }
}
