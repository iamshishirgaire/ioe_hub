import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:ioe_hub/features/file_downloads/blocs/file_download_bloc/file_download_bloc.dart';
import 'package:ioe_hub/features/file_downloads/blocs/file_download_bloc/file_download_event.dart';
import 'package:ioe_hub/features/file_downloads/blocs/file_download_bloc/file_download_state.dart';
import 'package:ioe_hub/features/profile/blocs/questions_bloc/offline_questions_bloc.dart';
import 'package:ioe_hub/features/profile/models/offline.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class PastQuestionDetailPage extends StatefulWidget {
  final String previewLink;
  final String subjectName;

  const PastQuestionDetailPage({
    super.key,
    required this.previewLink,
    required this.subjectName,
  });

  @override
  State<PastQuestionDetailPage> createState() => _PastQuestionDetailPageState();
}

class _PastQuestionDetailPageState extends State<PastQuestionDetailPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch event to check if the file exists
    final fileId = widget.previewLink.split("/")[5];
    BlocProvider.of<FileDownloadBloc>(context)
        .add(CheckFileExistsEvent(fileId));
  }

  @override
  Widget build(BuildContext context) {
    var fileId = widget.previewLink.split("/")[5];
    var modifiedLink = "https://drive.google.com/uc?export=download&id=$fileId";

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.subjectName.toUpperCase(),
            style: const TextStyle(fontSize: 13, letterSpacing: 0),
          ),
          actions: <Widget>[
            BlocConsumer<FileDownloadBloc, FileDownloadState>(
              listener: (context, state) => {
                //on download success add a event to add to offline questions bloc
                if (state is FileDownloadSuccess)
                  {
                    context.read<OfflineQuestionsBloc>().add(
                          AddOfflinequestion(
                              question: Offline(
                                  fileId: fileId,
                                  name: widget.subjectName,
                                  type: "question",
                                  path: state.filePath)),
                        )
                  }
              },
              builder: (context, state) {
                if (state is FileDownloadInProgress) {
                  if (state.progress == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.scale(
                        scale: 0.5,
                        child: CircularProgressIndicator(
                            strokeWidth: 6.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary,
                            )),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.scale(
                      scale: 0.5,
                      child: CircularProgressIndicator(
                          value: state.progress,
                          strokeWidth: 6.0,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.primary,
                          )),
                    ),
                  );
                } else if (state is FileDownloadSuccess ||
                    state is FileExistsState) {
                  // Show a checkmark if the file is already downloaded or download completed
                  return IconButton(
                    icon: Icon(
                      Icons.cloud_done,
                      color: Theme.of(context).colorScheme.primary,
                      semanticLabel: 'Download Complete',
                    ),
                    onPressed: null,
                  );
                } else if (state is FileDownloadFailure) {
                  // Show error icon if the download fails
                  return IconButton(
                    icon: Icon(
                      Icons.error,
                      color: Theme.of(context).colorScheme.error,
                      semanticLabel: 'Download Failed',
                    ),
                    onPressed: null,
                  );
                }

                // Initial state: Show download icon
                return IconButton(
                  icon: const Icon(
                    Icons.cloud_download_outlined,
                    semanticLabel: 'Download',
                  ),
                  onPressed: () {
                    showDownloadDialog(context, modifiedLink, fileId);
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<FileDownloadBloc, FileDownloadState>(
            builder: (context, state) {
          if (state is FileExistsState) {
            return const PDF().fromAsset(
              state.filePath,
              errorWidget: (dynamic error) =>
                  Center(child: Text(error.toString())),
            );
          } else {
            return const PDF().cachedFromUrl(modifiedLink,
                placeholder: (double progress) => Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.inkDrop(
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${progress.toStringAsFixed(0)}%",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )),
                errorWidget: (dynamic error) =>
                    Center(child: Text(error.toString())));
          }
        }));
  }

  void showDownloadDialog(BuildContext context, String url, String fileName) {
    showDialog(
      context: context,
      builder: (context) => BlocBuilder<FileDownloadBloc, FileDownloadState>(
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Download PDF'),
            content: const Text('Do you want to download this file?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<FileDownloadBloc>(context)
                      .add(DownloadFileEvent(url, fileName));
                },
                child: const Text('Download'),
              ),
            ],
          );
        },
      ),
    );
  }
}
