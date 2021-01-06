import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:swamedia_test/src/bloc/post-bloc/post-event.dart';
import 'package:swamedia_test/src/bloc/post-bloc/post-state.dart';
import 'package:swamedia_test/src/models/post-model.dart';
import 'package:swamedia_test/src/services/post-service.dart';

const _limit = 10;
List<PostModel> searchResult = [];

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState());

  final PostService service = new PostService();

  bool _hasReachedMax(int postsCount) => postsCount < _limit ? true : false;

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostState> _mapPostFetchedToState(PostState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await service.fetchPosts();
        searchResult = posts;
        return state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: _hasReachedMax(posts.length),
        );
      }
      final posts = await service.fetchPosts(state.posts.length);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: _hasReachedMax(posts.length),
            );
    } on Exception {
      return state.copyWith(status: PostStatus.failure);
    }
  }
}
