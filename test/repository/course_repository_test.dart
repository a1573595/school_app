import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_app/repository/course_repository.dart';

import '../dao/fake/fake_course_dao.dart';
import '../dao/fake/fake_db.dart';

void main() {
  final courseRepository = CourseRepositoryImp(dao: FakeCourseDao());

  group("Course repository test", () {
    test("Create course", () async {
      final list = await courseRepository.getCourseList();

      expect(const ListEquality().equals(list, [course1, course2, course3]), true);
    });
  });
}
