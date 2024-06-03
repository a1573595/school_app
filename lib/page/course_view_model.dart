import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/l10n/l10n.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/teacher.dart';

part 'course_page.dart';

final List<(Teacher, List<Course>)> teacherWithCourseList = [
  (
    Teacher(
      id: 0,
      status: UserStatus.activate,
      role: TeacherRole.lecturer,
      email: "Teacher email",
      name: "Teacher name",
    ),
    [
      Course(
        id: 0,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 1,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 2,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
    ],
  ),
  (
    Teacher(
      id: 0,
      status: UserStatus.activate,
      role: TeacherRole.lecturer,
      email: "Teacher email",
      name: "Teacher name",
    ),
    [
      Course(
        id: 0,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 1,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 2,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
    ],
  ),
  (
    Teacher(
      id: 0,
      status: UserStatus.activate,
      role: TeacherRole.lecturer,
      email: "Teacher email",
      name: "Teacher name",
    ),
    [
      Course(
        id: 0,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 1,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
      Course(
        id: 2,
        name: "Course name",
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        teacherId: 0,
        studentIdList: [],
      ),
    ],
  ),
];
