import 'package:auto_route/auto_route.dart';
import 'package:ioe_hub/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(page: HomeRoute.page),
        CupertinoRoute(page: CoursesRoute.page),
        CupertinoRoute(page: SemesterRoute.page),
        CupertinoRoute(page: SubjectsDetailRoute.page),
        CupertinoRoute(page: PastQuestionsRoute.page),
        CupertinoRoute(page: PastQuestionDetailRoute.page),
        CupertinoRoute(page: NoteListRoute.page),
        CupertinoRoute(page: NoteDetailsRoute.page),
        CupertinoRoute(page: PastQuestionDetailRoute.page),
        CupertinoRoute(page: DownloadRoute.page),
        CupertinoRoute(page: ContributionRoute.page),
        CupertinoRoute(page: IssueRoute.page),
        CupertinoRoute(page: OfflineContentView.page),
        CupertinoRoute(page: SubjectsRoute.page),
        MaterialRoute(
          page: OnBoardingRoute.page,
        ),
        MaterialRoute(page: SplashRoute.page, initial: true),
        CupertinoRoute(page: LoginRoute.page),
        CupertinoRoute(page: RegisterRoute.page),
        CupertinoRoute(page: ForgotPasswordRoute.page),
        CupertinoRoute(page: MySpaceRoute.page),
        CupertinoRoute(page: AboutRoute.page),
        CupertinoRoute(page: ProfileDetailRoute.page),
        CupertinoRoute(page: AuthResetPasswordRoute.page)
      ];
}
