import 'package:dio/dio.dart';
import 'package:school_app/api/course_api.dart';
import 'package:school_app/api/user_api.dart';
import 'package:school_app/configs.dart';

class ApiService {
  static final ApiService _instance = ApiService._();

  factory ApiService() => _instance;

  late final UserApi _userApi;

  UserApi get userApi => _userApi;

  late final CourseApi _courseApi;

  CourseApi get courseApi => _courseApi;

  ApiService._() {
    final dio = Dio(BaseOptions(
      connectTimeout: Configs.defaultTimeout,
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    ));

    _userApi = UserApiImp(dio: dio);
    _courseApi = CourseApiImp(dio: dio);
  }
}
