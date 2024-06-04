import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_app/page/course_view_model.dart';

import '../test_widget.dart';

// import '../repository/fake/fake_course_repository.dart';
// import '../repository/fake/fake_user_repository.dart';

void main() {
  // final userRepository = FakeUserRepository();
  // final courseRepository = FakeCourseRepository();

  group("Course page test", () {
    testWidgets("Loading", (widgetTester) async {
      await widgetTester.pumpWidget(buildTestWidget(
        overrides: [
          courseViewModel.overrideWith((ref) => Future.delayed(Duration.zero)),
        ],
        home: const CoursePage(),
      ));

      final errorText = find.descendant(of: find.byType(Center), matching: find.byType(Text));
      expect(errorText, findsOneWidget);
    });

    testWidgets("Error", (widgetTester) async {
      await widgetTester.pumpWidget(buildTestWidget(
        overrides: [
          courseViewModel.overrideWith((ref) => Future.delayed(Duration.zero)),
        ],
        home: const CoursePage(),
      ));

      await widgetTester.pumpAndSettle();

      final errorText = find.descendant(of: find.byType(Center), matching: find.byType(Text));
      expect(errorText, findsOneWidget);
    });

    testWidgets("Success", (widgetTester) async {
      await widgetTester.pumpWidget(buildTestWidget(
        overrides: [
          courseViewModel.overrideWith((ref) => Future.value([])),
        ],
        home: const CoursePage(),
      ));

      await widgetTester.pumpAndSettle();

      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);
    });

    // testWidgets("Loading", (widgetTester) async {
    //   await widgetTester.pumpWidget(buildTestWidget(
    //     home: const CoursePage(),
    //   ));
    //   await widgetTester.pumpAndSettle();
    //
    //   final element = widgetTester.element(find.byType(CoursePage));
    //   final container = ProviderScope.containerOf(element);
    //   container.read(courseViewModel.notifier).state = const AsyncValue.loading();
    //   await widgetTester.pump();
    //
    //   final loader = find.byType(CircularProgressIndicator);
    //   expect(loader, findsOneWidget);
    // });
  });
}
