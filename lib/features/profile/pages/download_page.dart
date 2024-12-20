import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ioe_hub/features/profile/widgets/download_notes_tab.dart';
import 'package:ioe_hub/features/profile/widgets/download_questions_tab.dart';

@RoutePage()
class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SAVED CONTENT'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Questions",
              ),
              Tab(text: "Notes"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DownloadQuestionsTab(),
            DownloadNotesTab(),
          ],
        ),
      ),
    );
  }
}
