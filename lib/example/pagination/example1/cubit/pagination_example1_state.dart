part of 'pagination_example1_cubit.dart';

@immutable
abstract class PaginationExample1State {}

class PaginationExample1Initial extends PaginationExample1State {}

class PaginationExample1Loaded extends PaginationExample1State {
  final List<PaginationExample1Model> posts;

  PaginationExample1Loaded(this.posts);
}

class PaginationExample1Loading extends PaginationExample1State {
  final List<PaginationExample1Model> oldPosts;
  final bool isFirstFetch;

  PaginationExample1Loading(this.oldPosts, {this.isFirstFetch = false});
}
