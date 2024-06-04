import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/l10n/l10n.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/teacher.dart';

part 'course_page.dart';

final courseViewModel = FutureProvider.autoDispose<List<(Teacher, List<Course>)>>((ref) => Future.delayed(
    const Duration(seconds: 3),
    () => [
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
        ]));

// final courseViewModel =
//     AsyncNotifierProvider.autoDispose<CourseNotifier, List<(Teacher, List<Course>)>>(CourseNotifier.new);
//
// class CourseNotifier extends AutoDisposeAsyncNotifier<List<(Teacher, List<Course>)>> {
//   @override
//   FutureOr<List<(Teacher, List<Course>)>> build() => Future.delayed(
//       const Duration(seconds: 3),
//       () => [
//             (
//               Teacher(
//                 id: 0,
//                 status: UserStatus.activate,
//                 role: TeacherRole.lecturer,
//                 email: "Teacher email",
//                 name: "Teacher name",
//               ),
//               [
//                 Course(
//                   id: 0,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//                 Course(
//                   id: 1,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//                 Course(
//                   id: 2,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//               ],
//             ),
//             (
//               Teacher(
//                 id: 0,
//                 status: UserStatus.activate,
//                 role: TeacherRole.lecturer,
//                 email: "Teacher email",
//                 name: "Teacher name",
//               ),
//               [
//                 Course(
//                   id: 0,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//                 Course(
//                   id: 1,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//                 Course(
//                   id: 2,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//               ],
//             ),
//             (
//               Teacher(
//                 id: 0,
//                 status: UserStatus.activate,
//                 role: TeacherRole.lecturer,
//                 email: "Teacher email",
//                 name: "Teacher name",
//               ),
//               [
//                 Course(
//                   id: 0,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//                 Course(
//                   id: 1,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//                 Course(
//                   id: 2,
//                   name: "Course name",
//                   startAt: DateTime.now(),
//                   endAt: DateTime.now(),
//                   teacherId: 0,
//                   studentIdList: [],
//                 ),
//               ],
//             ),
//           ]);
// }
