import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/shimmer_list.dart';
import 'package:ioe_hub/core/utils/map_course_to_icon.dart';
import 'package:ioe_hub/core/utils/snake_case.dart';
import 'package:ioe_hub/features/my_space/widget/my_space_tile.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';
import 'package:ioe_hub/features/syllabus/bloc/faculty/faculty_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/faculty/faculty_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/faculty/faculty_state.dart';
import 'package:ioe_hub/features/syllabus/models/faculty.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

@RoutePage()
class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text('COURSES'),
      ),
      body: BlocProvider(
        create: (context) =>
            FacultyBloc(getIt<FacultyRepository>())..add(LoadFaculties()),
        child: BlocBuilder<FacultyBloc, FacultyState>(
          builder: (context, state) {
            if (state is FacultyLoading) {
              return const ShimmerList();
            } else if (state is FacultyLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const MySpaceTile(),
                    ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                      shrinkWrap:
                          true, // Allow the ListView to take only the space it needs
                      itemCount: state.faculties.length,
                      itemBuilder: (context, index) {
                        final faculty = state.faculties[index];
                        return FacultyListTile(faculty: faculty);
                      },
                    ),
                  ],
                ),
              );
            } else if (state is FacultyError) {
              return Center(
                  child: Text('Failed to load faculties: ${state.error}'));
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}

class FacultyListTile extends StatelessWidget {
  final Faculty faculty;

  const FacultyListTile({super.key, required this.faculty});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: theme.colorScheme.surface,
      ),
      child: GenericListTile(
        leading: mapCourseToIcon(faculty.name) != null
            ? SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
                mapCourseToIcon(faculty.name)!,
                width: 30.0,
                height: 30.0,
              )
            : const Icon(Iconsax.book),
        title: Text(
          toTitleCase(faculty.name),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(
              'Semesters: ${faculty.numberOfSemesters}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            Text(
              'Subjects: ${faculty.numberOfSubjects}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        trailing: Icon(
          Iconsax.arrow_right4,
          color: theme.colorScheme.secondary,
          size: 20.0,
        ),
        onTap: () {
          AutoRouter.of(context).push(SemesterRoute(courseId: faculty.id));
        },
      ),
    );
  }
}
