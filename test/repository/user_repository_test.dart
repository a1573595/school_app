import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_app/repository/user_repository.dart';

import '../dao/fake/fake_db.dart';
import '../dao/fake/fake_user_dao.dart';

void main() {
  final userRepository = UserRepositoryImp(dao: FakeUserDao());

  group("User repository test", () {
    test("Get student list by course", () async {
      final list = (await userRepository.getStudentListByCourse(course: course1));

      expect(const ListEquality().equals(list, [student1]), true);
    });
  });
}
