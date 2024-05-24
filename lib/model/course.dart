import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:school_app/db/db_helper.dart';

part 'course.g.dart';

@JsonSerializable()
class Course with EquatableMixin {
  @JsonKey(name: columnCourseId)
  final int id;

  // final int year;
  // final bool semester;
  // final int credits;
  @JsonKey(name: columnCourseName)
  final String name;

  // final String description;
  // final String classRoom;
  @JsonKey(name: columnCourseStartAt, fromJson: timestampToDateTime, toJson: dateTimeToTimeStamp)
  final DateTime startAt;
  @JsonKey(name: columnCourseEndAt, fromJson: timestampToDateTime, toJson: dateTimeToTimeStamp)
  final DateTime endAt;
  @JsonKey(name: columnCourseTeacherId)
  final int teacherId;
  @JsonKey(name: columnCourseStudentIdList, fromJson: stringToListInt, toJson: listIntToString)
  final List<int> studentIdList;

  const Course({
    required this.id,
    // required this.year,
    // required this.semester,
    required this.name,
    // required this.description,
    // required this.classRoom,
    required this.startAt,
    required this.endAt,
    required this.teacherId,
    required this.studentIdList,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  static DateTime timestampToDateTime(int value) => DateTime.fromMicrosecondsSinceEpoch(value);

  static int dateTimeToTimeStamp(DateTime value) => value.microsecondsSinceEpoch;

  static List<int> stringToListInt(String value) => jsonDecode(value).cast<int>().toList();

  static String listIntToString(List<int> value) => jsonEncode(value);

  Course copyWith({
    String? name,
    DateTime? startAt,
    DateTime? endAt,
    int? teacherId,
    List<int>? studentIdList,
  }) =>
      Course(
        id: id,
        name: name ?? this.name,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
        teacherId: teacherId ?? this.teacherId,
        studentIdList: studentIdList ?? this.studentIdList,
      );

  String get dateTimeString => "${DateFormat('Per EEE kk:mm~').format(startAt)}${DateFormat('kk:mm').format(endAt)}";

  @override
  List<Object?> get props => [
        id,
        name,
        startAt,
        endAt,
        teacherId,
        studentIdList,
      ];
}
