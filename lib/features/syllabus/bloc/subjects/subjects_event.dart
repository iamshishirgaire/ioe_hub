import 'package:equatable/equatable.dart';

abstract class SubjectsEvent extends Equatable {
  const SubjectsEvent();

  @override
  List<Object> get props => [];
}

class LoadSubjects extends SubjectsEvent {
  final int semesterId;
  final int? electiveGroupId;
  const LoadSubjects({
    required this.semesterId,
    this.electiveGroupId,
  });
}

class LoadSubjectDetail extends SubjectsEvent {
  final int subjectId;
  final int? electiveSubjectId;
  const LoadSubjectDetail({
    required this.subjectId,
    this.electiveSubjectId,
  });
}
