import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/enum/teacher_role.dart';
import 'package:school_app/enum/user_status.dart';
import 'package:school_app/model/course.dart';
import 'package:school_app/model/student.dart';
import 'package:school_app/model/teacher.dart';
import 'package:school_app/repository/course_repository.dart';
import 'package:school_app/repository/user_repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteTestInit();

  await DbHelper.testInit();

  final userRepository = UserRepositoryImp();
  final courseRepository = CourseRepositoryImp();

  group("Dao test", () {
    test("Create teacher", () async {
      await userRepository.postTeacher(
        role: teacher1.role,
        email: teacher1.email,
        password: "password",
        name: teacher1.name,
      );
      await userRepository.postTeacher(
        role: teacher2.role,
        email: teacher2.email,
        password: "password",
        name: teacher2.name,
      );

      final list = await userRepository.getTeacherList();
      expect(const ListEquality().equals(list, [teacher1, teacher2]), true);
    });

    test("Create student", () async {
      await userRepository.postStudent(
        email: student1.email,
        password: "password",
        name: student1.name,
      );
      await userRepository.postStudent(
        email: student2.email,
        password: "password",
        name: student2.name,
      );

      final list = await userRepository.getStudentList();
      expect(const ListEquality().equals(list, [student1, student2]), true);
    });

    test("Create course", () async {
      await courseRepository.postCourse(
        name: course1.name,
        startAt: course1.startAt,
        endAt: course1.endAt,
        teacher: teacher1,
        studentIdList: course1.studentIdList,
      );

      final course = (await courseRepository.getCourseList()).first;
      expect(course, course1);
    });

    test("Get course list by teacher", () async {
      final list = (await courseRepository.getCourseListByTeacher(teacher: teacher1));

      expect(const ListEquality().equals(list, [course1]), true);
    });

    test("Get student list by course", () async {
      final list = (await userRepository.getStudentListByCourse(course: course1));

      expect(const ListEquality().equals(list, [student1]), true);
    });

    test("Edit course", () async {
      const name = "test";
      await courseRepository.putCourse(
        course: course1.copyWith(name: name)
      );

      final course = (await courseRepository.getCourseList()).first;
      expect(course.name, name);
    });

    test("Delete course", () async {
      await courseRepository.deleteCourse(course: course1);

      final list = (await courseRepository.getCourseList());
      expect(list.length, 0);
    });
  });
}

/// Initialize sqflite for test.
void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void initData() {}

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
  teacherId: 2,
  studentIdList: [student1.id, student2.id],
);
