import 'dart:convert';

import 'package:school_app/db/db_helper.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:sqflite/sqflite.dart';

abstract class CourseDao {
  Future<List<Course>> getCourseList();

  Future<List<Course>> getCourseListByStudent({required Student student});

  Future<List<Course>> getCourseListByTeacher({required Teacher teacher});

  Future<int> postCourse({
    required String name,
    required DateTime startAt,
    required DateTime endAt,
    required Teacher teacher,
    required List<int> studentIdList,
  });

  Future<int> putCourse({required Course course});

  Future<int> deleteCourse({required Course course});
}

class CourseDaoImp implements CourseDao {
  final Database _db;

  const CourseDaoImp({required Database database}) : _db = database;

  @override
  Future<int> deleteCourse({required Course course}) => _db.rawDelete('''
      Delete FROM $tableCourse 
      WHERE 
        $columnCourseId LIKE ${course.id}
      ''');

  @override
  Future<List<Course>> getCourseList() => _db.rawQuery('''
      SELECT
        course.$columnCourseId,
        course.$columnCourseName,
        course.$columnCourseStartAt,
        course.$columnCourseEndAt,
        course.$columnCourseTeacherId,
        course.$columnCourseStudentIdList
      FROM $tableCourse
      ''').then((value) => value.map((e) => Course.fromJson(e)).toList());

  @override
  Future<List<Course>> getCourseListByStudent({required Student student}) => _db.rawQuery('''
      SELECT * FROM $tableCourse 
      WHERE 
        $columnCourseStudentIdList LIKE '%' || ${student.id} || '%'
      ''').then((value) => value.map(Course.fromJson).toList());

  @override
  Future<List<Course>> getCourseListByTeacher({required Teacher teacher}) => _db.rawQuery('''
      SELECT 
        $columnCourseId,
        $columnCourseName,
        $columnCourseStartAt,
        $columnCourseEndAt,
        $columnCourseTeacherId,
        $columnCourseStudentIdList
      FROM $tableCourse 
      WHERE 
        $columnCourseTeacherId LIKE ${teacher.id}
      ''').then((value) => value.map(Course.fromJson).toList());

  @override
  Future<int> postCourse({
    required String name,
    required DateTime startAt,
    required DateTime endAt,
    required Teacher teacher,
    required List<int> studentIdList,
  }) =>
      _db.rawInsert('''
      INSERT INTO $tableCourse(
        $columnCourseName,
        $columnCourseStartAt,
        $columnCourseEndAt,
        $columnCourseTeacherId,
        $columnCourseStudentIdList
      )
      VALUES(
        "$name",
        ${startAt.microsecondsSinceEpoch},
        ${endAt.microsecondsSinceEpoch},
        ${teacher.id},
        "${jsonEncode(studentIdList)}"
      )
  ''');

  @override
  Future<int> putCourse({required Course course}) => _db.rawUpdate('''
      UPDATE $tableCourse SET
        $columnCourseName = "${course.name}",
        $columnCourseStartAt = ${course.startAt.millisecondsSinceEpoch},
        $columnCourseEndAt = ${course.endAt.millisecondsSinceEpoch},
        $columnCourseTeacherId = ${course.teacherId},
        $columnCourseStudentIdList = "${jsonEncode(course.studentIdList)}"
      WHERE
        $columnCourseId LIKE ${course.id}
  ''');
}
