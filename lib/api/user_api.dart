import 'package:dio/dio.dart';
import 'package:school_app/model/teacher.dart';

abstract class UserApi {
  Future<void> postOauth({required String email, required String password});

  Future<void> getOauthMe();

  Future<List<Teacher>> getTeacherList();
}

class UserApiImp implements UserApi {
  final Dio _dio;

  const UserApiImp({required Dio dio}) : _dio = dio;

  @override
  Future<void> postOauth({required String email, required String password}) {
    // TODO: implement postOauth
    throw UnimplementedError();
  }

  @override
  Future<void> getOauthMe() {
    // TODO: implement getOauthMe
    throw UnimplementedError();
  }

  @override
  Future<List<Teacher>> getTeacherList() {
    // TODO: implement getTeacherList
    throw UnimplementedError();
  }
}
