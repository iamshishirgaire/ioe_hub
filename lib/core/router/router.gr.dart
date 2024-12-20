// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:ioe_hub/features/auth/models/user.dart' as _i25;
import 'package:ioe_hub/features/auth/pages/forgot_password.dart' as _i6;
import 'package:ioe_hub/features/auth/pages/login.dart' as _i9;
import 'package:ioe_hub/features/auth/pages/profile_detail.dart' as _i17;
import 'package:ioe_hub/features/auth/pages/register.dart' as _i18;
import 'package:ioe_hub/features/auth/pages/reset_password.dart' as _i2;
import 'package:ioe_hub/features/home/pages/home_page.dart' as _i7;
import 'package:ioe_hub/features/my_space/pages/my_space.dart' as _i10;
import 'package:ioe_hub/features/notes/pages/note_details_page.dart' as _i11;
import 'package:ioe_hub/features/notes/pages/note_list_page.dart' as _i12;
import 'package:ioe_hub/features/onboarding/pages/index.dart' as _i14;
import 'package:ioe_hub/features/pastPaper/pages/past_question_detail_page.dart'
    as _i15;
import 'package:ioe_hub/features/pastPaper/pages/past_questions_page.dart'
    as _i16;
import 'package:ioe_hub/features/profile/pages/about_page.dart' as _i1;
import 'package:ioe_hub/features/profile/pages/contribute_page.dart' as _i3;
import 'package:ioe_hub/features/profile/pages/download_page.dart' as _i5;
import 'package:ioe_hub/features/profile/pages/issue_page.dart' as _i8;
import 'package:ioe_hub/features/profile/pages/offline_content_view.dart'
    as _i13;
import 'package:ioe_hub/features/splash/splash.dart' as _i20;
import 'package:ioe_hub/features/syllabus/pages/courses_page.dart' as _i4;
import 'package:ioe_hub/features/syllabus/pages/semester_page.dart' as _i19;
import 'package:ioe_hub/features/syllabus/pages/subjects_detail_page.dart'
    as _i21;
import 'package:ioe_hub/features/syllabus/pages/subjects_page.dart' as _i22;

/// generated route for
/// [_i1.AboutPage]
class AboutRoute extends _i23.PageRouteInfo<void> {
  const AboutRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutPage();
    },
  );
}

/// generated route for
/// [_i2.AuthResetPasswordPage]
class AuthResetPasswordRoute
    extends _i23.PageRouteInfo<AuthResetPasswordRouteArgs> {
  AuthResetPasswordRoute({
    _i24.Key? key,
    required String email,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          AuthResetPasswordRoute.name,
          args: AuthResetPasswordRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthResetPasswordRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthResetPasswordRouteArgs>();
      return _i2.AuthResetPasswordPage(
        key: args.key,
        email: args.email,
      );
    },
  );
}

class AuthResetPasswordRouteArgs {
  const AuthResetPasswordRouteArgs({
    this.key,
    required this.email,
  });

  final _i24.Key? key;

  final String email;

  @override
  String toString() {
    return 'AuthResetPasswordRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i3.ContributionPage]
class ContributionRoute extends _i23.PageRouteInfo<void> {
  const ContributionRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ContributionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i3.ContributionPage();
    },
  );
}

/// generated route for
/// [_i4.CoursesPage]
class CoursesRoute extends _i23.PageRouteInfo<void> {
  const CoursesRoute({List<_i23.PageRouteInfo>? children})
      : super(
          CoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoursesRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i4.CoursesPage();
    },
  );
}

/// generated route for
/// [_i5.DownloadPage]
class DownloadRoute extends _i23.PageRouteInfo<void> {
  const DownloadRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DownloadRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i5.DownloadPage();
    },
  );
}

/// generated route for
/// [_i6.ForgotPasswordPage]
class ForgotPasswordRoute extends _i23.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomePage();
    },
  );
}

/// generated route for
/// [_i8.IssuePage]
class IssueRoute extends _i23.PageRouteInfo<void> {
  const IssueRoute({List<_i23.PageRouteInfo>? children})
      : super(
          IssueRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssueRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i8.IssuePage();
    },
  );
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i23.PageRouteInfo<void> {
  const LoginRoute({List<_i23.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginPage();
    },
  );
}

/// generated route for
/// [_i10.MySpacePage]
class MySpaceRoute extends _i23.PageRouteInfo<void> {
  const MySpaceRoute({List<_i23.PageRouteInfo>? children})
      : super(
          MySpaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySpaceRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i10.MySpacePage();
    },
  );
}

/// generated route for
/// [_i11.NoteDetailsPage]
class NoteDetailsRoute extends _i23.PageRouteInfo<NoteDetailsRouteArgs> {
  NoteDetailsRoute({
    _i24.Key? key,
    required String previewLink,
    required String subjectName,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          NoteDetailsRoute.name,
          args: NoteDetailsRouteArgs(
            key: key,
            previewLink: previewLink,
            subjectName: subjectName,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteDetailsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteDetailsRouteArgs>();
      return _i11.NoteDetailsPage(
        key: args.key,
        previewLink: args.previewLink,
        subjectName: args.subjectName,
      );
    },
  );
}

class NoteDetailsRouteArgs {
  const NoteDetailsRouteArgs({
    this.key,
    required this.previewLink,
    required this.subjectName,
  });

  final _i24.Key? key;

  final String previewLink;

  final String subjectName;

  @override
  String toString() {
    return 'NoteDetailsRouteArgs{key: $key, previewLink: $previewLink, subjectName: $subjectName}';
  }
}

/// generated route for
/// [_i12.NoteListPage]
class NoteListRoute extends _i23.PageRouteInfo<void> {
  const NoteListRoute({List<_i23.PageRouteInfo>? children})
      : super(
          NoteListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoteListRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.NoteListPage();
    },
  );
}

/// generated route for
/// [_i13.OfflineContentView]
class OfflineContentView extends _i23.PageRouteInfo<OfflineContentViewArgs> {
  OfflineContentView({
    _i24.Key? key,
    required String path,
    required String subjectName,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          OfflineContentView.name,
          args: OfflineContentViewArgs(
            key: key,
            path: path,
            subjectName: subjectName,
          ),
          initialChildren: children,
        );

  static const String name = 'OfflineContentView';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OfflineContentViewArgs>();
      return _i13.OfflineContentView(
        key: args.key,
        path: args.path,
        subjectName: args.subjectName,
      );
    },
  );
}

class OfflineContentViewArgs {
  const OfflineContentViewArgs({
    this.key,
    required this.path,
    required this.subjectName,
  });

  final _i24.Key? key;

  final String path;

  final String subjectName;

  @override
  String toString() {
    return 'OfflineContentViewArgs{key: $key, path: $path, subjectName: $subjectName}';
  }
}

/// generated route for
/// [_i14.OnBoardingPage]
class OnBoardingRoute extends _i23.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i23.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.OnBoardingPage();
    },
  );
}

/// generated route for
/// [_i15.PastQuestionDetailPage]
class PastQuestionDetailRoute
    extends _i23.PageRouteInfo<PastQuestionDetailRouteArgs> {
  PastQuestionDetailRoute({
    _i24.Key? key,
    required String previewLink,
    required String subjectName,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          PastQuestionDetailRoute.name,
          args: PastQuestionDetailRouteArgs(
            key: key,
            previewLink: previewLink,
            subjectName: subjectName,
          ),
          initialChildren: children,
        );

  static const String name = 'PastQuestionDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PastQuestionDetailRouteArgs>();
      return _i15.PastQuestionDetailPage(
        key: args.key,
        previewLink: args.previewLink,
        subjectName: args.subjectName,
      );
    },
  );
}

class PastQuestionDetailRouteArgs {
  const PastQuestionDetailRouteArgs({
    this.key,
    required this.previewLink,
    required this.subjectName,
  });

  final _i24.Key? key;

  final String previewLink;

  final String subjectName;

  @override
  String toString() {
    return 'PastQuestionDetailRouteArgs{key: $key, previewLink: $previewLink, subjectName: $subjectName}';
  }
}

/// generated route for
/// [_i16.PastQuestionsPage]
class PastQuestionsRoute extends _i23.PageRouteInfo<void> {
  const PastQuestionsRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PastQuestionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PastQuestionsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.PastQuestionsPage();
    },
  );
}

/// generated route for
/// [_i17.ProfileDetailPage]
class ProfileDetailRoute extends _i23.PageRouteInfo<ProfileDetailRouteArgs> {
  ProfileDetailRoute({
    _i24.Key? key,
    required _i25.User user,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          ProfileDetailRoute.name,
          args: ProfileDetailRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileDetailRouteArgs>();
      return _i17.ProfileDetailPage(
        key: args.key,
        user: args.user,
      );
    },
  );
}

class ProfileDetailRouteArgs {
  const ProfileDetailRouteArgs({
    this.key,
    required this.user,
  });

  final _i24.Key? key;

  final _i25.User user;

  @override
  String toString() {
    return 'ProfileDetailRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i18.RegisterPage]
class RegisterRoute extends _i23.PageRouteInfo<void> {
  const RegisterRoute({List<_i23.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i18.RegisterPage();
    },
  );
}

/// generated route for
/// [_i19.SemesterPage]
class SemesterRoute extends _i23.PageRouteInfo<SemesterRouteArgs> {
  SemesterRoute({
    _i24.Key? key,
    required int courseId,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          SemesterRoute.name,
          args: SemesterRouteArgs(
            key: key,
            courseId: courseId,
          ),
          initialChildren: children,
        );

  static const String name = 'SemesterRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SemesterRouteArgs>();
      return _i19.SemesterPage(
        key: args.key,
        courseId: args.courseId,
      );
    },
  );
}

class SemesterRouteArgs {
  const SemesterRouteArgs({
    this.key,
    required this.courseId,
  });

  final _i24.Key? key;

  final int courseId;

  @override
  String toString() {
    return 'SemesterRouteArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i20.SplashPage]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i20.SplashPage();
    },
  );
}

/// generated route for
/// [_i21.SubjectsDetailPage]
class SubjectsDetailRoute extends _i23.PageRouteInfo<SubjectsDetailRouteArgs> {
  SubjectsDetailRoute({
    _i24.Key? key,
    required int subjectId,
    int? electiveSubjectId,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          SubjectsDetailRoute.name,
          args: SubjectsDetailRouteArgs(
            key: key,
            subjectId: subjectId,
            electiveSubjectId: electiveSubjectId,
          ),
          initialChildren: children,
        );

  static const String name = 'SubjectsDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubjectsDetailRouteArgs>();
      return _i21.SubjectsDetailPage(
        key: args.key,
        subjectId: args.subjectId,
        electiveSubjectId: args.electiveSubjectId,
      );
    },
  );
}

class SubjectsDetailRouteArgs {
  const SubjectsDetailRouteArgs({
    this.key,
    required this.subjectId,
    this.electiveSubjectId,
  });

  final _i24.Key? key;

  final int subjectId;

  final int? electiveSubjectId;

  @override
  String toString() {
    return 'SubjectsDetailRouteArgs{key: $key, subjectId: $subjectId, electiveSubjectId: $electiveSubjectId}';
  }
}

/// generated route for
/// [_i22.SubjectsPage]
class SubjectsRoute extends _i23.PageRouteInfo<SubjectsRouteArgs> {
  SubjectsRoute({
    _i24.Key? key,
    required int semesterId,
    int? electiveGroupId,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          SubjectsRoute.name,
          args: SubjectsRouteArgs(
            key: key,
            semesterId: semesterId,
            electiveGroupId: electiveGroupId,
          ),
          initialChildren: children,
        );

  static const String name = 'SubjectsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubjectsRouteArgs>();
      return _i22.SubjectsPage(
        key: args.key,
        semesterId: args.semesterId,
        electiveGroupId: args.electiveGroupId,
      );
    },
  );
}

class SubjectsRouteArgs {
  const SubjectsRouteArgs({
    this.key,
    required this.semesterId,
    this.electiveGroupId,
  });

  final _i24.Key? key;

  final int semesterId;

  final int? electiveGroupId;

  @override
  String toString() {
    return 'SubjectsRouteArgs{key: $key, semesterId: $semesterId, electiveGroupId: $electiveGroupId}';
  }
}
