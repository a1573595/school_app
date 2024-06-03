import 'package:school_app/db/course_dao.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';

abstract class CourseRepository {
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

class CourseRepositoryImp implements CourseRepository {
  final CourseDao _dao;

  CourseRepositoryImp({CourseDao? dao}) : _dao = dao ?? DbHelper.courseDao;

  @override
  Future<int> deleteCourse({required Course course}) => _dao.deleteCourse(course: course);

  @override
  Future<List<Course>> getCourseList() => _dao.getCourseList();

  @override
  Future<List<Course>> getCourseListByStudent({required Student student}) =>
      _dao.getCourseListByStudent(student: student);

  @override
  Future<List<Course>> getCourseListByTeacher({required Teacher teacher}) =>
      _dao.getCourseListByTeacher(teacher: teacher);

  @override
  Future<int> postCourse({
    required String name,
    required DateTime startAt,
    required DateTime endAt,
    required Teacher teacher,
    required List<int> studentIdList,
  }) =>
      _dao.postCourse(
        name: name,
        startAt: startAt,
        endAt: endAt,
        teacher: teacher,
        studentIdList: studentIdList,
      );

  @override
  Future<int> putCourse({required Course course}) => _dao.putCourse(course: course);
}
