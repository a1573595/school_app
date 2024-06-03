import 'package:school_app/db/course_dao.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';

import 'fake_db.dart';

class FakeCourseDao implements CourseDao {
  @override
  Future<int> deleteCourse({required Course course}) => Future.value(course.id);

  @override
  Future<List<Course>> getCourseList() => Future.value([course1, course2, course3]);

  @override
  Future<List<Course>> getCourseListByStudent({required Student student}) => Future.value([course1, course3]);

  @override
  Future<List<Course>> getCourseListByTeacher({required Teacher teacher}) => Future.value([course1, course2]);

  @override
  Future<int> postCourse({
    required String name,
    required DateTime startAt,
    required DateTime endAt,
    required Teacher teacher,
    required List<int> studentIdList,
  }) =>
      Future.value(4);

  @override
  Future<int> putCourse({required Course course}) => Future.value(course.id);
}
