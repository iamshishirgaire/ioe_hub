import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/shimmer_list.dart';
import 'package:ioe_hub/core/utils/separate_letter_digits.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';
import 'package:ioe_hub/features/syllabus/bloc/semester/semester_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/semester/semester_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/semester/semester_state.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

@RoutePage()
class SemesterPage extends StatefulWidget {
  final int courseId;
  const SemesterPage({super.key, required this.courseId});

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEMESTERS'),
      ),
      body: BlocProvider(
        create: (context) => SemestersBloc(getIt<FacultyRepository>())
          ..add(LoadSemesters(courseId: widget.courseId)),
        child: BlocBuilder<SemestersBloc, SemestersState>(
          builder: (context, state) {
            if (state is SemesterLoading) {
              return const ShimmerList();
            } else if (state is SemesterLoaded) {
              return ListView.builder(
                itemCount: state.semesters.length,
                itemBuilder: (context, index) {
                  final semester = state.semesters[index];
                  return SemesterListTile(semester: semester);
                },
              );
            } else if (state is SemesterError) {
              return Center(
                  child: Text('Failed to load semesters: ${state.error}'));
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}

class SemesterListTile extends StatelessWidget {
  final Semester semester;

  const SemesterListTile({super.key, required this.semester});

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
        title: Text(
          separateLettersDigits(semester.name),
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
              'Subjects: ${semester.numberOfSubjects}',
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
          AutoRouter.of(context).push(SubjectsRoute(semesterId: semester.id));
        },
      ),
    );
  }
}
