import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/l10n/l10n.dart';
import 'package:school_app/page/course_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.initForTest();

  runApp(const ProviderScope(
    child: SchoolApp(),
  ));
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        expansionTileTheme: ExpansionTileThemeData(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          collapsedShape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: const CoursePage(),
    );
  }
}
