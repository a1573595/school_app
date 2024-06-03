import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

final teacher1 = Teacher(
  id: 1,
  status: UserStatus.activate,
  role: TeacherRole.lecturer,
  email: "email",
  name: "Lecturer 1",
);

final teacher2 = Teacher(
  id: 2,
  status: UserStatus.activate,
  role: TeacherRole.professor,
  email: "email2",
  name: "Professor 1",
);

final student1 = Student(
  id: 1,
  status: UserStatus.activate,
  email: "email",
  name: "Student 1",
);

final student2 = Student(
  id: 2,
  status: UserStatus.activate,
  email: "email2",
  name: "Student 2",
);

final course1 = Course(
  id: 1,
  name: "Course 1",
  startAt: DateTime.now().add(const Duration(minutes: -60)),
  endAt: DateTime.now(),
  teacherId: 1,
  studentIdList: [student1.id],
);

final course2 = Course(
  id: 2,
  name: "Course 2",
  startAt: DateTime.now().add(const Duration(minutes: -60)),
  endAt: DateTime.now(),
  teacherId: 1,
  studentIdList: [student2.id],
);

final course3 = Course(
  id: 3,
  name: "Course 3",
  startAt: DateTime.now().add(const Duration(minutes: -60)),
  endAt: DateTime.now(),
  teacherId: 2,
  studentIdList: [student1.id, student2.id],
);
