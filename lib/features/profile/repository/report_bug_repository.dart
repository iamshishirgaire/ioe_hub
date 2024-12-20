import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/profile/models/report_bug.dart';

@Injectable()
class BugRepository {
  final List<BugReport> _bugReports = [];
  // final ApiClient _apiClient;

  // BugRepository(this._apiClient);

  // Fake submission endpoint
  Future<void> submitBugReport(String title, String description) async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));

    // Creating a new BugReport
    final bugReport = BugReport(
      id: "121211",
      title: title,
      description: description,
      reportedAt: DateTime.now(),
      status: "submitted",
    );

    // Adding the bug report to the list
    _bugReports.add(bugReport);
  }

  // Fake fetch endpoint
  Future<List<BugReport>> fetchBugReports() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));

    return _bugReports;
  }
}
