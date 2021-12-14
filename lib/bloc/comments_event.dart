import 'package:equatable/equatable.dart';

abstract class CommentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CommentsFetched extends CommentsEvent {}
