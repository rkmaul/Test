import 'package:flutter/material.dart';
import 'package:swamedia_test/src/models/post-model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key key, @required this.post, this.length, this.text})
      : super(key: key);

  final PostModel post;
  final int length;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}', style: textTheme.caption),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
