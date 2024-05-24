// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: (json['student_id'] as num).toInt(),
      status: $enumDecode(_$UserStatusEnumMap, json['student_status']),
      email: json['student_email'] as String,
      name: json['student_name'] as String,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'student_id': instance.id,
      'student_status': _$UserStatusEnumMap[instance.status]!,
      'student_email': instance.email,
      'student_name': instance.name,
    };

const _$UserStatusEnumMap = {
  UserStatus.inActivate: 0,
  UserStatus.activate: 1,
};
