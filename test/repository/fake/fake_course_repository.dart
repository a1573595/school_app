import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:school_app/repository/course_repository.dart';

class FakeCourseRepository implements CourseRepository {
  @override
  Future<int> deleteCourse({required Course course}) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getCourseList() {
    // TODO: implement getCourseList
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getCourseListByStudent({required Student student}) {
    // TODO: implement getCourseListByStudent
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getCourseListByTeacher({required Teacher teacher}) {
    // TODO: implement getCourseListByTeacher
    throw UnimplementedError();
  }

  @override
  Future<int> postCourse({
    required String name,
    required DateTime startAt,
    required DateTime endAt,
    required Teacher teacher,
    required List<int> studentIdList,
  }) {
    // TODO: implement postCourse
    throw UnimplementedError();
  }

  @override
  Future<int> putCourse({required Course course}) {
    // TODO: implement putCourse
    throw UnimplementedError();
  }
}
