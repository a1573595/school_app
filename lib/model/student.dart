import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/model/user.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends User with EquatableMixin {
  @JsonKey(name: columnStudentId)
  @override
  final int id;

  @JsonKey(name: columnStudentStatus)
  @override
  final UserStatus status;

  @JsonKey(name: columnStudentEmail)
  @override
  final String email;

  @JsonKey(name: columnStudentName)
  @override
  final String name;

  Student({
    required this.id,
    required this.status,
    required this.email,
    required this.name,
  }) : super(id: id, status: status, email: email, name: name);

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Student copyWith({
    String? name,
  }) =>
      Student(
        id: id,
        status: status,
        email: email,
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [
        id,
        status,
        email,
        name,
      ];
}
