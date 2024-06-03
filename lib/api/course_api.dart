import 'package:dio/dio.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/teacher.dart';

abstract class CourseApi {
  Future<List<Course>> getCourseList();

  Future<List<Course>> getCourseListByTeacher({required Teacher teacher});
}

class CourseApiImp implements CourseApi {
  final Dio _dio;

  const CourseApiImp({required Dio dio}) : _dio = dio;

  @override
  Future<List<Course>> getCourseList() {
    // TODO: implement getCourseList
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getCourseListByTeacher({required Teacher teacher}) {
    // TODO: implement getCourseListByTeacher
    throw UnimplementedError();
  }
}
