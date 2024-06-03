import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_app/db/course_dao.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/db/user_dao.dart';

import 'fake/fake_db.dart';

void main() async {
  late UserDao userDao;
  late CourseDao courseDao;

  setUpAll(() async {
    sqfliteTestInit();

    await DbHelper.initForTest();

    userDao = DbHelper.userDao;
    courseDao = DbHelper.courseDao;
  });

  tearDownAll(() async {
    await DbHelper.deInit();
  });

  group("Dao test", () {
    test("Create teacher", () async {
      await userDao.postTeacher(
        role: teacher1.role,
        email: teacher1.email,
        password: "password",
        name: teacher1.name,
      );
      await userDao.postTeacher(
        role: teacher2.role,
        email: teacher2.email,
        password: "password",
        name: teacher2.name,
      );

      final list = await userDao.getTeacherList();
      expect(const ListEquality().equals(list, [teacher1, teacher2]), true);
    });

    test("Create student", () async {
      await userDao.postStudent(
        email: student1.email,
        password: "password",
        name: student1.name,
      );
      await userDao.postStudent(
        email: student2.email,
        password: "password",
        name: student2.name,
      );

      final list = await userDao.getStudentList();
      expect(const ListEquality().equals(list, [student1, student2]), true);
    });

    test("Create course", () async {
      await courseDao.postCourse(
        name: course1.name,
        startAt: course1.startAt,
        endAt: course1.endAt,
        teacher: teacher1,
        studentIdList: course1.studentIdList,
      );
      await courseDao.postCourse(
        name: course2.name,
        startAt: course2.startAt,
        endAt: course2.endAt,
        teacher: teacher1,
        studentIdList: course2.studentIdList,
      );
      await courseDao.postCourse(
        name: course3.name,
        startAt: course3.startAt,
        endAt: course3.endAt,
        teacher: teacher2,
        studentIdList: course3.studentIdList,
      );

      final list = await courseDao.getCourseList();
      expect(const ListEquality().equals(list, [course1, course2, course3]), true);
    });

    test("Get teacher with course list", () async {
      final list = await userDao.getTeacherWithCourseList();

      expect(const ListEquality().equals(list.first.$2, [course1, course2]), true);
    });

    test("Get course list by teacher", () async {
      final list = (await courseDao.getCourseListByTeacher(teacher: teacher1));

      expect(const ListEquality().equals(list, [course1, course2]), true);
    });

    test("Get course list by student", () async {
      final list = (await courseDao.getCourseListByStudent(student: student1));

      expect(const ListEquality().equals(list, [course1, course3]), true);
    });

    test("Get student list by course", () async {
      final list = (await userDao.getStudentListByCourse(course: course1));

      expect(const ListEquality().equals(list, [student1]), true);
    });

    test("Edit course", () async {
      const name = "test";
      await courseDao.putCourse(course: course1.copyWith(name: name));

      final course = (await courseDao.getCourseList()).first;
      expect(course.name, name);
    });

    test("Delete course", () async {
      await courseDao.deleteCourse(course: course1);

      final list = (await courseDao.getCourseList());
      expect(list.length, 2);
    });
  });
}
