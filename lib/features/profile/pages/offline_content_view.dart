import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:ioe_hub/core/ui/app_error_widget.dart';

@RoutePage()
class OfflineContentView extends StatefulWidget {
  final String path;
  final String subjectName;

  const OfflineContentView(
      {super.key, required this.path, required this.subjectName});

  @override
  State<OfflineContentView> createState() => _OfflineContentViewState();
}

class _OfflineContentViewState extends State<OfflineContentView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subjectName.toUpperCase(),
          style: const TextStyle(fontSize: 13, letterSpacing: 0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.cloud_done,
              semanticLabel: 'Downloaded',
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const PDF().fromAsset(widget.path,
          // placeholder: (double progress) => Center(
          //         child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         LoadingAnimationWidget.halfTriangleDot(
          //             color: Theme.of(context).colorScheme.primary, size: 30),
          //         const SizedBox(height: 10),
          //         Text(
          //           progress.toStringAsFixed(0),
          //           style: Theme.of(context).textTheme.bodyLarge,
          //         )
          //       ],
          //     )),
          errorWidget: (dynamic error) => const AppErrorWidget(
                message: "Failed to load",
              )),
    );
  }
}
