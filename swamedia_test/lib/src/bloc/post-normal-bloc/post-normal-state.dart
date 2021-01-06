import 'package:equatable/equatable.dart';
import 'package:swamedia_test/src/models/post-model.dart';

enum PostStatusNormal { initial, success, failure }

class PostStateNormal extends Equatable {
  const PostStateNormal({
    this.status = PostStatusNormal.initial,
    this.posts = const <PostModel>[],
  });

  final PostStatusNormal status;
  final List<PostModel> posts;

  PostStateNormal copyWith({
    PostStatusNormal status,
    List<PostModel> posts,
  }) {
    return PostStateNormal(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [status, posts];
}
