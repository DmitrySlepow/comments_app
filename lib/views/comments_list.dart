import 'package:comments_app/bloc/comments_bloc.dart';
import 'package:comments_app/bloc/comments_state.dart';
import 'package:comments_app/widgets/comments_list_item.dart';
import 'package:comments_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
      switch (state.commentsStatus) {
        case CommentsStatus.failure:
          return const Center(
            child: Text('Failed to fetch posts'),
          );
        case CommentsStatus.success:
          if (state.comments.isEmpty) {
            return const Center(
              child: Text('No posts'),
            );
          } else {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return CommentsListItem(comment: state.comments[index]);
              },
              itemCount: state.comments.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                );
              },
            );
          }
        default:
          return const LoadingIndicator();
      }
    });
  }
}
