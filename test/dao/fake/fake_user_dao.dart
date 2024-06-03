import 'package:school_app/db/user_dao.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';

import 'fake_db.dart';

class FakeUserDao implements UserDao {
  @override
  Future<List<Student>> getStudentList() => Future.value([student1, student2]);

  @override
  Future<List<Student>> getStudentListByCourse({required Course course}) => Future.value([student1]);

  @override
  Future<List<Teacher>> getTeacherList() => Future.value([teacher1, teacher2]);

  @override
  Future<List<(Teacher, List<Course>)>> getTeacherWithCourseList() => Future.value([
        (teacher1, [course1, course3]),
        (teacher2, [course2]),
      ]);

  @override
  Future<int> postStudent({required String email, required String password, required String name}) => Future.value(3);

  @override
  Future<int> postTeacher({
    required TeacherRole role,
    required String email,
    required String password,
    required String name,
  }) =>
      Future.value(3);
}
