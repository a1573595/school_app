import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/db/user_dao.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';

final userRepository = Provider<UserRepository>((ref) => UserRepositoryImp());

abstract class UserRepository {
  Future<List<Teacher>> getTeacherList();

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

class UserRepositoryImp implements UserRepository {
  final UserDao _dao;

  UserRepositoryImp({UserDao? dao}) : _dao = dao ?? DbHelper.userDao;

  @override
  Future<List<Student>> getStudentList() => _dao.getStudentList();

  @override
  Future<List<Student>> getStudentListByCourse({required Course course}) => _dao.getStudentListByCourse(course: course);

  @override
  Future<List<Teacher>> getTeacherList() => _dao.getTeacherList();

  @override
  Future<int> postTeacher({
    required TeacherRole role,
    required String email,
    required String password,
    required String name,
  }) =>
      _dao.postTeacher(role: role, email: email, password: password, name: name);

  @override
  Future<int> postStudent({
    required String email,
    required String password,
    required String name,
  }) =>
      _dao.postStudent(email: email, password: password, name: name);
}
