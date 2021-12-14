import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        body = json['body'];

  @override
  List<Object?> get props => [id, name, email, body];
}
