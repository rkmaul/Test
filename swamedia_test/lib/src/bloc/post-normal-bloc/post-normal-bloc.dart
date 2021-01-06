import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:swamedia_test/src/bloc/post-normal-bloc/post-normal-event.dart';
import 'package:swamedia_test/src/bloc/post-normal-bloc/post-normal-state.dart';
import 'package:swamedia_test/src/models/post-model.dart';
import 'package:swamedia_test/src/services/post-service.dart';

List<PostModel> searchResult = [];

class PostNormalBloc extends Bloc<PostEventNormal, PostStateNormal> {
  PostNormalBloc() : super(const PostStateNormal());

  final PostService service = new PostService();

  @override
  Stream<Transition<PostEventNormal, PostStateNormal>> transformEvents(
    Stream<PostEventNormal> events,
    TransitionFunction<PostEventNormal, PostStateNormal> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostStateNormal> mapEventToState(PostEventNormal event) async* {
    if (event is PostFetchedNormal) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostStateNormal> _mapPostFetchedToState(PostStateNormal state) async {
    try {
      if (state.status == PostStatusNormal.initial) {
        final posts = await service.getListPost();
        searchResult = posts;
        return state.copyWith(
          status: PostStatusNormal.success,
          posts: posts,
        );
      }
      final posts = await service.getListPost();
      return posts.isEmpty
          ? state.copyWith()
          : state.copyWith(
              status: PostStatusNormal.success,
              posts: List.of(state.posts)..addAll(posts),
            );
    } on Exception {
      return state.copyWith(status: PostStatusNormal.failure);
    }
  }
}
