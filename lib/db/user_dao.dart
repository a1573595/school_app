import 'package:school_app/db/db_helper.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:sqflite/sqflite.dart';

typedef TeacherWithCourseList = (Teacher, List<Course>);

final List<TeacherWithCourseList> teacherWithCourseList = [
  (
    Teacher(
      id: 0,
      status: UserStatus.activate,
      role: TeacherRole.lecturer,
      email: "Teacher email",
      name: "Teacher name",
    ),
    [
      Course(
        id: 0,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 1,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 2,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
    ],
  ),
  (
    Teacher(
      id: 0,
      status: UserStatus.activate,
      role: TeacherRole.lecturer,
      email: "Teacher email",
      name: "Teacher name",
    ),
    [
      Course(
        id: 0,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 1,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 2,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
    ],
  ),
  (
    Teacher(
      id: 0,
      status: UserStatus.activate,
      role: TeacherRole.lecturer,
      email: "Teacher email",
      name: "Teacher name",
    ),
    [
      Course(
        id: 0,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 1,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 2,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
    ],
  ),
];

abstract class UserDao {
  final Database _db;

  const UserDao({required Database database}) : _db = database;

  Future<List<Teacher>> getTeacherList();

  // Future<List<TeacherWithCourseList>> getTeacherWitherCourseList();

  Future<List<Student>> getStudentList();

  Future<List<Student>> getStudentListByCourse({required Course course});

  Future<int> postTeacher({
    required TeacherRole role,
    required String email,
    required String password,
    required String name,
  });

  Future<int> postStudent({
    required String email,
    required String password,
    required String name,
  });
}

class UserDaoImp extends UserDao {
  const UserDaoImp({required super.database});

  @override
  Future<List<Student>> getStudentList() => _db.rawQuery('''
      SELECT
        $columnStudentId,
        $columnStudentStatus,
        $columnStudentEmail,
        $columnStudentName
      FROM $tableStudent
      ''').then((value) => value.map(Student.fromJson).toList());

  @override
  Future<List<Student>> getStudentListByCourse({required Course course}) => _db.rawQuery('''
      SELECT
        student.$columnStudentId,
        student.$columnStudentStatus,
        student.$columnStudentEmail,
        student.$columnStudentName
      FROM $tableCourse course
      JOIN $tableStudent student ON
        course.$columnCourseStudentIdList LIKE '%' || student.$columnStudentId || '%'
      WHERE 
        course.$columnCourseId = ${course.id}
      ''').then((value) => value.map(Student.fromJson).toList());

  @override
  Future<List<Teacher>> getTeacherList() => _db.rawQuery('''
      SELECT
        $columnTeacherId,
        $columnTeacherStatus,
        $columnTeacherRole,
        $columnTeacherEmail,
        $columnTeacherName
      FROM $tableTeacher
  ''').then((value) => value.map(Teacher.fromJson).toList());

  @override
  Future<int> postTeacher({
    required TeacherRole role,
    required String email,
    required String password,
    required String name,
  }) =>
      _db.rawInsert('''
      INSERT INTO $tableTeacher(
        $columnTeacherRole,
        $columnTeacherEmail,
        $columnTeacherPassword,
        $columnTeacherName
      ) 
      VALUES(
        ${role.value},
        "$email",
        "$password",
        "$name"
      )
  ''');

  @override
  Future<int> postStudent({
    required String email,
    required String password,
    required String name,
  }) =>
      _db.rawInsert('''
      INSERT INTO $tableStudent(
        $columnStudentEmail,
        $columnStudentPassword,
        $columnStudentName
      ) 
      VALUES(
        "$email",
        "$password",
        "$name"
      )
  ''');
}
