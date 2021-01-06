import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;
import 'package:swamedia_test/src/bloc/post-bloc/post-bloc.dart';
import 'package:swamedia_test/src/bloc/post-bloc/post-event.dart';
import 'package:swamedia_test/src/models/post-model.dart';
import 'package:swamedia_test/src/services/post-service.dart';
import 'package:swamedia_test/src/view/post-view/post-list.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

TextEditingController controller = new TextEditingController();

PostService service = new PostService();

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get with Infinite scroll"),
      ),
      body: BlocProvider(
        create: (_) => PostBloc()..add(PostFetched()),
        child: PostsList(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service.fetchPosts();
  }
}
