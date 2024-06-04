import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:school_app/repository/user_repository.dart';

class FakeUserRepository implements UserRepository {
  @override
  Future<List<Student>> getStudentList() {
    // TODO: implement getStudentList
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getStudentListByCourse({required Course course}) {
    // TODO: implement getStudentListByCourse
    throw UnimplementedError();
  }

  @override
  Future<List<Teacher>> getTeacherList() {
    // TODO: implement getTeacherList
    throw UnimplementedError();
  }

  @override
  Future<List<(Teacher, List<Course>)>> getTeacherWithCourseList() {
    // TODO: implement getTeacherWithCourseList
    throw UnimplementedError();
  }

  @override
  Future<int> postStudent({required String email, required String password, required String name}) {
    // TODO: implement postStudent
    throw UnimplementedError();
  }

  @override
  Future<int> postTeacher(
      {required TeacherRole role, required String email, required String password, required String name}) {
    // TODO: implement postTeacher
    throw UnimplementedError();
  }
}
