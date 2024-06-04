import 'package:collection/collection.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:sqflite/sqflite.dart';

abstract class UserDao {
  Future<List<Teacher>> getTeacherList();

  Future<List<(Teacher, List<Course>)>> getTeacherWithCourseList();

  Future<int> postTeacher({
    required TeacherRole role,
    required String email,
    required String password,
    required String name,
  });

  Future<List<Student>> getStudentList();

  Future<List<Student>> getStudentListByCourse({required Course course});

  Future<int> postStudent({
    required String email,
    required String password,
    required String name,
  });
}

class UserDaoImp implements UserDao {
  final Database _db;

  const UserDaoImp({required Database database}) : _db = database;

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
  Future<List<(Teacher, List<Course>)>> getTeacherWithCourseList() => _db.rawQuery("""
      SELECT
        teacher.$columnTeacherId,
        teacher.$columnTeacherStatus,
        teacher.$columnTeacherEmail,
        teacher.$columnTeacherName,
        teacher.$columnTeacherRole,
        course.$columnCourseId,
        course.$columnCourseName,
        course.$columnCourseStartAt,
        course.$columnCourseEndAt,
        course.$columnCourseTeacherId,
        course.$columnCourseStudentIdList
      FROM $tableTeacher teacher
      LEFT JOIN $tableCourse course ON
        teacher.$columnTeacherId = course.$columnCourseTeacherId
    """).then((value) => value.groupListsBy((e) => e[columnTeacherId])).then((value) => value.entries
      .map((e) => (
            Teacher.fromJson(e.value.first),
            e.value.map(Course.fromJson).toList(),
          ))
      .toList());

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
