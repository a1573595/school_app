import 'package:flutter_test/flutter_test.dart';

import '../repository/fake/fake_course_repository.dart';
import '../repository/fake/fake_user_repository.dart';

void main() {
  final userRepository = FakeUserRepository();
  final courseRepository = FakeCourseRepository();

  group("Course page test", () {
    testWidgets("", (widgetTester) async {});
  });
}
