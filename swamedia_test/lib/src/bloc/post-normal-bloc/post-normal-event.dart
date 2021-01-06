import 'package:equatable/equatable.dart';

abstract class PostEventNormal extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetchedNormal extends PostEventNormal {}
