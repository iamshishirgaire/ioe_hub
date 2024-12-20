import 'package:equatable/equatable.dart';

abstract class ContributionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContributionInitial extends ContributionState {}

class ContributionLoading extends ContributionState {}

class ContributionSuccess extends ContributionState {}

class ContributionFailure extends ContributionState {
  final String error;

  ContributionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
