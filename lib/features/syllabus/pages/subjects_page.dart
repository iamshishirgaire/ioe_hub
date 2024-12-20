import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/shimmer_list.dart';
import 'package:ioe_hub/core/utils/group_name_convert.dart';
import 'package:ioe_hub/core/utils/snake_case.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_state.dart';
import 'package:ioe_hub/features/syllabus/models/elective.dart';
import 'package:ioe_hub/features/syllabus/models/subject.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

@RoutePage()
class SubjectsPage extends StatefulWidget {
  final int semesterId;
  final int? electiveGroupId;
  const SubjectsPage(
      {super.key, required this.semesterId, this.electiveGroupId});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SUBJECTS'),
      ),
      body: BlocProvider(
        create: (context) => SubjectsBloc(getIt<FacultyRepository>())
          ..add(LoadSubjects(
            semesterId: widget.electiveGroupId != null ? -1 : widget.semesterId,
            electiveGroupId: widget.electiveGroupId,
          )),
        child: BlocBuilder<SubjectsBloc, SubjectsState>(
          builder: (context, state) {
            if (state is SubjectsLoading) {
              return const ShimmerList();
            } else if (state is SubjectsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: state.subjects.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final sub = state.subjects[index];
                        return SubjectListTile(subject: sub);
                      },
                    ),
                    state.electives != null
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.electives!.length,
                            itemBuilder: (context, index) {
                              final sub = state.electives![index];
                              return ElectiveTile(subject: sub);
                            },
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            } else if (state is SubjectsError) {
              return Center(
                  child: Text('Failed to load subjects: ${state.error}'));
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}

class SubjectListTile extends StatelessWidget {
  final Subject subject;

  const SubjectListTile({super.key, required this.subject});

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
          toTitleCase(subject.name),
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
              '',
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
          AutoRouter.of(context).push(SubjectsDetailRoute(
            subjectId: subject.id,
          ));
        },
      ),
    );
  }
}

class ElectiveTile extends StatelessWidget {
  final Elective subject;

  const ElectiveTile({super.key, required this.subject});

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
          toExtendedGroupName(subject.groupName),
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
              '',
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
          AutoRouter.of(context)
              .push(SubjectsRoute(semesterId: -1, electiveGroupId: subject.id));
        },
      ),
    );
  }
}
