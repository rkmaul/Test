import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swamedia_test/src/bloc/post-normal-bloc/post-normal-bloc.dart';
import 'package:swamedia_test/src/bloc/post-normal-bloc/post-normal-event.dart';
import 'package:swamedia_test/src/services/post-service.dart';
import 'package:swamedia_test/src/view/normal-post-view/post-list-normal.dart';

class PostPageNormal extends StatefulWidget {
  @override
  _PostPageNormalState createState() => _PostPageNormalState();
}

TextEditingController controller = new TextEditingController();

PostService service = new PostService();

class _PostPageNormalState extends State<PostPageNormal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get all item in Post list"),
      ),
      body: BlocProvider(
        create: (_) => PostNormalBloc()..add(PostFetchedNormal()),
        child: PostListNormal(),
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
