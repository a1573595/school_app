import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/model/user.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher extends User with EquatableMixin {
  @JsonKey(name: columnTeacherId)
  @override
  final int id;

  @JsonKey(name: columnTeacherStatus)
  @override
  final UserStatus status;

  @JsonKey(name: columnTeacherRole)
  final TeacherRole role;

  @JsonKey(name: columnTeacherEmail)
  @override
  final String email;

  @JsonKey(name: columnTeacherName)
  @override
  final String name;

  Teacher({
    required this.id,
    required this.status,
    required this.role,
    required this.email,
    required this.name,
  }) : super(id: id, status: status, email: email, name: name);

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Teacher copyWith({
    String? name,
    TeacherRole? role,
  }) =>
      Teacher(
        id: id,
        status: status,
        email: email,
        name: name ?? this.name,
        role: role ?? this.role,
      );

  @override
  List<Object?> get props => [
        id,
        status,
        role,
        email,
        name,
      ];
}
