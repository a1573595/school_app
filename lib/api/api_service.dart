import 'package:school_app/api/course_api.dart';
import 'package:school_app/api/user_api.dart';

class ApiService {
  static final ApiService _instance = ApiService._();

  factory ApiService() => _instance;

  late final UserApi _userApi;

  UserApi get userApi => _userApi;

  late final CourseApi _courseApi;

  CourseApi get courseApi => _courseApi;

  ApiService._() {
    /// todo init http client
    _userApi = UserApiImp();
    _courseApi = CourseApiImp();
  }
}
