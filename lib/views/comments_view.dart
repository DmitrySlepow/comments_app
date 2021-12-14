import 'package:comments_app/bloc/comments_bloc.dart';
import 'package:comments_app/bloc/comments_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'comments_list.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: BlocProvider(
        create: (_) => CommentsBloc()..add(CommentsFetched()),
        child: const CommentsList(),
      ),
    );
  }
}
