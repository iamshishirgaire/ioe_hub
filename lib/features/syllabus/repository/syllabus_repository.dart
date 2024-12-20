import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/db/sqlite.dart';
import 'package:ioe_hub/features/syllabus/models/elective.dart';
import 'package:ioe_hub/features/syllabus/models/faculty.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';
import 'package:ioe_hub/features/syllabus/models/subject.dart';
import 'package:ioe_hub/features/syllabus/models/subject_detail.dart';

@Injectable()
class FacultyRepository {
  final DatabaseHelper _dbHelper;

  // Inject the DatabaseHelper via constructor
  FacultyRepository(this._dbHelper);

  // Fetch all faculties with their semesters and subjects
  Future<List<Faculty>> getAllFaculties() async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> facultiesData = await db.rawQuery('''
      	SELECT f.id,
        f.name AS name, 
        COUNT(DISTINCT s.id) AS numberOfSemesters, 
        COUNT(s.id) AS numberOfSubjects,
	      COUNT(DISTINCT(e.id)) AS numberOfElectiveGroups
      	from faculty f 
	      LEFT join semester s on s.faculty_id = f.id
 	      LEFT JOIN 
        subject sub ON s.id = sub.semester_id
	      LEFT JOIN 
        elective_group  e ON e.semester_id = s.id
      	GROUP BY 
        f.id
    ''');
    List<Faculty> faculties = [];
    for (var facultyRow in facultiesData) {
      faculties.add(Faculty.fromJson(facultyRow));
    }
    return faculties;
  }

  Future<List<Semester>> getAllSemesters(int courseId) async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> facultiesData = await db.rawQuery('''
              SELECT 
            s.id AS id,
            s.name AS name,
            s.faculty_id as facultyId,
            COUNT(sub.id) AS numberOfSubjects,
            COUNT(DISTINCT(e.id)) AS numberOfElectives
            FROM 
            semester s
            LEFT JOIN 
            subject sub ON s.id = sub.semester_id
		        LEFT JOIN 
            elective_group e ON e.semester_id = s.id
            WHERE 
            s.faculty_id = $courseId
            GROUP BY 
            s.id
            ORDER by  name;

    ''');
    List<Semester> semesters = [];
    for (var facultyRow in facultiesData) {
      semesters.add(Semester.fromJson(facultyRow));
    }
    return semesters;
  }

  Future<List<Subject>> getAllSubjects(
    int semesterId,
  ) async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> subjectsData = await db.rawQuery('''
       SELECT 
        id,
        name,
        semester_id as semesterId
       from subject
        where subject.semester_id = $semesterId;
    ''');
    List<Subject> subjects = [];
    for (var subjectsRow in subjectsData) {
      subjects.add(Subject.fromJson(subjectsRow));
    }
    return subjects;
  }

  Future<List<Elective>> getElectiveGroups(
    int semesterId,
  ) async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> subjectsData = await db.rawQuery('''
       SELECT 
        id,
        group_name as groupName,
        semester_id as semesterId
       from elective_group e
        where e.semester_id = $semesterId;
    ''');
    List<Elective> electives = [];
    for (var subjectsRow in subjectsData) {
      electives.add(Elective.fromJson(subjectsRow));
    }
    return electives;
  }

  Future<List<Subject>> getAllElectiveSubjects(
    int electiveGroupId,
  ) async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> subjectsData = await db.rawQuery('''
       SELECT 
        id,
        name,
        elective_group_id as semesterId
       from elective_subject e
        where e.elective_group_id = $electiveGroupId;
    ''');
    List<Subject> subjects = [];
    for (var subjectsRow in subjectsData) {
      subjects.add(Subject.fromJson(subjectsRow));
    }
    return subjects;
  }

  Future<SubjectDetail> getSubjectDetail(int subjectId) async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> subjectData = await db.rawQuery('''
          SELECT 
          id,
          name,
          content
          from subject
          where 
          id = $subjectId

    ''');
    return SubjectDetail.fromJson(subjectData[0]);
  }

  Future<SubjectDetail> getElectiveSubjectDetail(int eleSubjectId) async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> esubjectData = await db.rawQuery('''
          SELECT 
          id,
          name,
          content
          from elective_subject
          where 
          id = $eleSubjectId

    ''');
    return SubjectDetail.fromJson(esubjectData[0]);
  }
}
