// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['course_id'] as num).toInt(),
      name: json['course_name'] as String,
      startAt:
          Course.timestampToDateTime((json['course_start_at'] as num).toInt()),
      endAt: Course.timestampToDateTime((json['course_end_at'] as num).toInt()),
      teacherId: (json['course_teacher_id'] as num).toInt(),
      studentIdList:
          Course.stringToListInt(json['course_student_id_list'] as String),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'course_id': instance.id,
      'course_name': instance.name,
      'course_start_at': Course.dateTimeToTimeStamp(instance.startAt),
      'course_end_at': Course.dateTimeToTimeStamp(instance.endAt),
      'course_teacher_id': instance.teacherId,
      'course_student_id_list': Course.listIntToString(instance.studentIdList),
    };
