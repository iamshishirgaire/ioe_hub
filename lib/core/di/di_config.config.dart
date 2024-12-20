// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/blocs/auth_bloc/auth_bloc.dart' as _i292;
import '../../features/auth/repository/auth_repository.dart' as _i871;
import '../../features/file_downloads/blocs/file_download_bloc/file_download_bloc.dart'
    as _i493;
import '../../features/file_downloads/repository/file_download_repository.dart'
    as _i443;
import '../../features/my_space/blocs/my_space_bloc/my_space_bloc.dart'
    as _i312;
import '../../features/my_space/repository/my_space_repository.dart' as _i244;
import '../../features/notes/blocs/note_bloc/note_bloc.dart' as _i1011;
import '../../features/notes/repository/note_repository.dart' as _i840;
import '../../features/pastPaper/bloc/questions_bloc.dart' as _i952;
import '../../features/pastPaper/repository/questions_repository.dart' as _i282;
import '../../features/profile/blocs/contribute_bloc/contribute_bloc.dart'
    as _i317;
import '../../features/profile/blocs/notes_bloc/offline_notes_bloc.dart'
    as _i984;
import '../../features/profile/blocs/questions_bloc/offline_questions_bloc.dart'
    as _i259;
import '../../features/profile/blocs/report_bug_bloc/report_bug_bloc.dart'
    as _i852;
import '../../features/profile/repository/contribute_repository.dart' as _i59;
import '../../features/profile/repository/offline_repository.dart' as _i86;
import '../../features/profile/repository/report_bug_repository.dart' as _i491;
import '../../features/syllabus/repository/syllabus_repository.dart' as _i774;
import '../api/dio.dart' as _i190;
import '../db/cache_manager.dart' as _i790;
import '../db/sqlite.dart' as _i434;
import '../files/file.dart' as _i302;
import '../theme/bloc/theme_bloc.dart' as _i279;
import 'modules/shared_preferences.dart' as _i397;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i59.QuestionRepository>(() => _i59.QuestionRepository());
    gh.factory<_i491.BugRepository>(() => _i491.BugRepository());
    gh.factory<_i279.ThemeCubit>(() => _i279.ThemeCubit());
    gh.factory<_i397.AppSharedPreferences>(() => _i397.AppSharedPreferences());
    gh.factory<_i790.CacheManagerService>(() => _i790.CacheManagerService());
    gh.factory<_i434.DatabaseHelper>(() => _i434.DatabaseHelper());
    gh.factory<_i302.FileHandler>(() => _i302.FileHandler());
    gh.factory<_i317.ContributionBloc>(() => _i317.ContributionBloc(
        questionRepository: gh<_i59.QuestionRepository>()));
    gh.factory<_i774.FacultyRepository>(
        () => _i774.FacultyRepository(gh<_i434.DatabaseHelper>()));
    gh.factory<_i244.MySpaceRepository>(() => _i244.MySpaceRepository(
          gh<_i397.AppSharedPreferences>(),
          gh<_i774.FacultyRepository>(),
        ));
    gh.factory<_i852.ReportBugBloc>(
        () => _i852.ReportBugBloc(bugRepository: gh<_i491.BugRepository>()));
    gh.factory<_i312.MySpaceBloc>(
        () => _i312.MySpaceBloc(gh<_i244.MySpaceRepository>()));
    gh.factory<_i86.OfflineRepository>(() => _i86.OfflineRepository(
          gh<_i434.DatabaseHelper>(),
          gh<_i302.FileHandler>(),
        ));
    gh.factory<_i190.ApiClient>(
        () => _i190.ApiClient(gh<_i397.AppSharedPreferences>()));
    gh.factory<_i984.OfflineNotesBloc>(
        () => _i984.OfflineNotesBloc(gh<_i86.OfflineRepository>()));
    gh.factory<_i259.OfflineQuestionsBloc>(
        () => _i259.OfflineQuestionsBloc(gh<_i86.OfflineRepository>()));
    gh.factory<_i871.AuthRepository>(() => _i871.AuthRepository(
          gh<_i190.ApiClient>(),
          gh<_i397.AppSharedPreferences>(),
        ));
    gh.factory<_i282.QuestionsRepository>(
        () => _i282.QuestionsRepository(gh<_i190.ApiClient>()));
    gh.factory<_i840.NoteRepository>(
        () => _i840.NoteRepository(gh<_i190.ApiClient>()));
    gh.factory<_i443.FileRepository>(
        () => _i443.FileRepository(gh<_i190.ApiClient>()));
    gh.factory<_i493.FileDownloadBloc>(
        () => _i493.FileDownloadBloc(gh<_i443.FileRepository>()));
    gh.factory<_i292.AuthBloc>(
        () => _i292.AuthBloc(gh<_i871.AuthRepository>()));
    gh.factory<_i1011.NoteBloc>(
        () => _i1011.NoteBloc(gh<_i840.NoteRepository>()));
    gh.factory<_i952.QuestionsBloc>(
        () => _i952.QuestionsBloc(gh<_i282.QuestionsRepository>()));
    return this;
  }
}
