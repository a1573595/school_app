part of 'course_view_model.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.current.course),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(courseViewModel).when(
          data: (data) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemBuilder: (context, index) => _TeacherItem(
              key: ValueKey(data[index].$1.id),
              isLast: index == (data.length - 1),
              data: data[index],
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}

class _TeacherItem extends HookWidget {
  const _TeacherItem({
    super.key,
    required this.isLast,
    required this.data,
  });

  final bool isLast;
  final (Teacher, List<Course>) data;

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
