import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/app_error_widget.dart';
import 'package:ioe_hub/features/profile/blocs/notes_bloc/offline_notes_bloc.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';

class DownloadNotesTab extends StatefulWidget {
  const DownloadNotesTab({super.key});

  @override
  State<DownloadNotesTab> createState() => _DownloadNotesTabState();
}

class _DownloadNotesTabState extends State<DownloadNotesTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<OfflineNotesBloc>()..add(const LoadOfflineNotes()),
        child: BlocConsumer<OfflineNotesBloc, OfflineNotesState>(
            listener: (context, state) {
          if (state is OfflineNoteTransactionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.message),
            ));
          }
          if (state is OfflineNoteTransactionError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.message),
            ));
          }
        }, builder: (context, state) {
          if (state is OfflineNotesLoading) {
            return const SizedBox(
              child: Text("Loading"),
            );
          }
          if (state is OfflineNotesError) {
            return const AppErrorWidget(
              message: "Failed to load",
            );
          }

          if (state is OfflineNotesLoaded && state.offlineNotes.isEmpty) {
            return const SizedBox(
              height: 200,
              child: AppErrorWidget(
                message: "No saved notes",
              ),
            );
          }
          if (state is OfflineNotesLoaded && state.offlineNotes.isNotEmpty) {
            return ListView.builder(
                itemCount: state.offlineNotes.length,
                itemBuilder: (context, index) {
                  final note = (state).offlineNotes[index];
                  return GenericListTile(
                    dismissible: true,
                    onDismiss: () {
                      context
                          .read<OfflineNotesBloc>()
                          .add(DeleteOfflineNote(note: note));
                      (state).offlineNotes.removeAt(index);
                    },
                    title: Text(note.name),
                    trailing: Icon(
                      Iconsax.arrow_right4,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 20.0,
                    ),
                    onTap: () {
                      AutoRouter.of(context).push(OfflineContentView(
                          path: note.path, subjectName: note.name));
                    },
                  );
                });
          } else {
            return const SizedBox(
              child: Text("ELSE All"),
            );
          }
        }));
  }
}
