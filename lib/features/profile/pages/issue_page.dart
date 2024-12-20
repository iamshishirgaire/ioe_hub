import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/features/profile/blocs/report_bug_bloc/report_bug_bloc.dart';
import 'package:ioe_hub/features/profile/blocs/report_bug_bloc/report_bug_event.dart';
import 'package:ioe_hub/features/profile/blocs/report_bug_bloc/report_bug_state.dart';

@RoutePage()
class IssuePage extends StatelessWidget {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReportBugBloc>(),
      child: IssueView(),
    );
  }
}

class IssueView extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  IssueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REPORT AN ISSUE"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/bug.svg",
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: "Issue Title"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(hintText: "Description"),
                  maxLines: 4,
                ),
              ),
              const SizedBox(height: 10),
              BlocConsumer<ReportBugBloc, ReportBugState>(
                listener: (context, state) {
                  if (state is BugReportSubmissionSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Issue reported successfully!')),
                    );
                  } else if (state is BugReportFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.error}')),
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    onPressed: () {
                      final title = _titleController.text;
                      final description = _descriptionController.text;
                      context.read<ReportBugBloc>().add(SubmitBugReport(
                          title: title, description: description));
                    },
                    isDisabled: state is BugReportLoading,
                    text: "Submit Issue",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
