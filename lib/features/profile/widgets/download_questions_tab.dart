import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/app_error_widget.dart';
import 'package:ioe_hub/features/profile/blocs/questions_bloc/offline_questions_bloc.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';

class DownloadQuestionsTab extends StatefulWidget {
  const DownloadQuestionsTab({super.key});

  @override
  State<DownloadQuestionsTab> createState() => _DownloadQuestionsTabState();
}

class _DownloadQuestionsTabState extends State<DownloadQuestionsTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<OfflineQuestionsBloc>()..add(const LoadOfflineQuestion()),
        child: BlocConsumer<OfflineQuestionsBloc, OfflineQuestionsState>(
            listener: (context, state) {
          if (state is OfflineQuestionTransactionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.message),
            ));
          }
          if (state is OfflineQuestionTransactionError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.message),
            ));
          }
        }, builder: (context, state) {
          if (state is OfflineQuestionsLoading) {
            return const SizedBox();
          }
          if (state is OfflineQuestionsError) {
            return const AppErrorWidget(
              message: "Failed to load",
            );
          }
          if (state is OfflineQuestionsLoaded &&
              state.offlineQuestions.isEmpty) {
            return const AppErrorWidget(
              message: "No saved questions",
            );
          }
          if (state is OfflineQuestionsLoaded &&
              state.offlineQuestions.isNotEmpty) {
            return ListView.builder(
                itemCount: state.offlineQuestions.length,
                itemBuilder: (context, index) {
                  final question = (state).offlineQuestions[index];
                  return GenericListTile(
                    dismissible: true,
                    onDismiss: () {
                      //add to bloc to delete
                      context
                          .read<OfflineQuestionsBloc>()
                          .add(DeleteOfflinequestion(question: question));
                      state.offlineQuestions.removeAt(index);
                    },
                    title: Text(question.name),
                    trailing: Icon(
                      Iconsax.arrow_right4,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 20.0,
                    ),
                    onTap: () {
                      AutoRouter.of(context).push(OfflineContentView(
                          path: question.path, subjectName: question.name));
                    },
                  );
                });
          }
          return const SizedBox();
        }));
  }
}
