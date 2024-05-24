import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:school_app/db/db_helper.dart';
import 'package:school_app/db/user_dao.dart';
import 'package:school_app/l10n/l10n.dart';
import 'package:school_app/model/course.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.testInit();

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("講師清單"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: teacherWithCourseList.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) => TeacherItem(
          key: ValueKey(teacherWithCourseList[index].$1.id),
          isLast: index == (teacherWithCourseList.length - 1),
          data: teacherWithCourseList[index],
        ),
      ),
    );
  }
}

class TeacherItem extends HookWidget {
  const TeacherItem({
    super.key,
    required this.isLast,
    required this.data,
  });

  final bool isLast;
  final TeacherWithCourseList data;

  @override
  Widget build(BuildContext context) {
    final isExpand = useState(false);
    final children = useMemoized(() => [
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Divider(),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          ...data.$2.map((e) => _CourseItem(key: ValueKey(e.id), e)),
        ]);

    return ExpansionTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        data.$1.role.toString(),
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey,
            ),
      ),
      subtitle: Text(
        data.$1.name,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(
        isExpand.value ? Icons.remove : Icons.add,
        color: Colors.black,
      ),
      children: children,
      onExpansionChanged: (expanded) => isExpand.value = expanded,
    );
  }
}

class _CourseItem extends StatelessWidget {
  const _CourseItem(this.course, {super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        /// todo change router
      },
      leading: const Icon(Icons.calendar_month),
      title: Text(
        course.name,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        course.dateTimeString,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
