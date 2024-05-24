// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: (json['teacher_id'] as num).toInt(),
      status: $enumDecode(_$UserStatusEnumMap, json['teacher_status']),
      role: $enumDecode(_$TeacherRoleEnumMap, json['teacher_role']),
      email: json['teacher_email'] as String,
      name: json['teacher_name'] as String,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'teacher_id': instance.id,
      'teacher_status': _$UserStatusEnumMap[instance.status]!,
      'teacher_role': _$TeacherRoleEnumMap[instance.role]!,
      'teacher_email': instance.email,
      'teacher_name': instance.name,
    };

const _$UserStatusEnumMap = {
  UserStatus.inActivate: 0,
  UserStatus.activate: 1,
};

const _$TeacherRoleEnumMap = {
  TeacherRole.professor: 0,
  TeacherRole.lecturer: 1,
};
