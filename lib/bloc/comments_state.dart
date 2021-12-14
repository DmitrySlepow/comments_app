import 'package:equatable/equatable.dart';

import 'package:comments_app/models/comment.dart';

enum CommentsStatus { initial, success, failure }

class CommentsState extends Equatable {
  final CommentsStatus commentsStatus;
  final List<Comment> comments;

  const CommentsState({
    this.commentsStatus = CommentsStatus.initial,
    this.comments = const <Comment>[],
  });

  @override
  List<Object?> get props => [commentsStatus, comments];

  CommentsState copyWith({
    CommentsStatus? commentsStatus,
    List<Comment>? comments,
  }) {
    return CommentsState(
      commentsStatus: commentsStatus ?? this.commentsStatus,
      comments: comments ?? this.comments,
    );
  }
}
