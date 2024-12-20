import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/utils/snake_case.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subject_detail_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_state.dart';
import 'package:ioe_hub/features/syllabus/models/subject_detail.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

@RoutePage()
class SubjectsDetailPage extends StatefulWidget {
  final int subjectId;
  final int? electiveSubjectId;
  const SubjectsDetailPage(
      {super.key, required this.subjectId, this.electiveSubjectId});

  @override
  State<SubjectsDetailPage> createState() => _SubjectsDetailPageState();
}

class _SubjectsDetailPageState extends State<SubjectsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectsDetailBloc(getIt<FacultyRepository>())
        ..add(LoadSubjectDetail(
          subjectId: widget.electiveSubjectId == null ? widget.subjectId : -1,
          electiveSubjectId: widget.electiveSubjectId,
        )),
      child: BlocBuilder<SubjectsDetailBloc, SubjectsState>(
        builder: (context, state) {
          if (state is SubjectDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SubjectDetailLoaded) {
            return SubjectHtmlView(subject: state.subject);
          } else if (state is SubjectDetailError) {
            return Center(
                child: Text('Failed to load subject Detail: ${state.error}'));
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}

class SubjectHtmlView extends StatefulWidget {
  final SubjectDetail subject;
  const SubjectHtmlView({super.key, required this.subject});

  @override
  State<SubjectHtmlView> createState() => _SubjectHtmlViewState();
}

class _SubjectHtmlViewState extends State<SubjectHtmlView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toTitleCase(widget.subject.name).toUpperCase()),
      ),
      body: Builder(builder: (context) {
        return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Markdown(
              data: widget.subject.content,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                //table decoration
                tableCellsPadding: const EdgeInsets.all(8),
                //table border
                tableBorder: TableBorder.all(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    width: 1),
                //table header
              ),
            ));
      }),
    );
  }
}
