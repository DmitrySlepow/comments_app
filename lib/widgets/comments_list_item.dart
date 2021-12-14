import 'package:comments_app/models/comment.dart';
import 'package:flutter/material.dart';

class CommentsListItem extends StatelessWidget {
  final Comment comment;
  const CommentsListItem({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            comment.email,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(comment.body),
        ],
      ),
    );
  }
}
