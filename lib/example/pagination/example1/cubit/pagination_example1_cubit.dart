import 'package:bloc/bloc.dart';
import 'package:example/example/pagination/example1/data/models/pagination_example1_model.dart';
import 'package:example/example/pagination/example1/data/repositories/pagination_example1_repository.dart';
import 'package:meta/meta.dart';


part 'pagination_example1_state.dart';

class PaginationExample1Cubit extends Cubit<PaginationExample1State> {
  PaginationExample1Cubit(this.repository) : super(PaginationExample1Initial());

  int page = 1;
  final PaginationExample1Repository repository;

  void loadPosts() {
    if (state is PaginationExample1Loading) return;

    final currentState = state;

    var oldPosts = <PaginationExample1Model>[];
    if (currentState is PaginationExample1Loaded) {
      oldPosts = currentState.posts;
    }

    emit(PaginationExample1Loading(oldPosts, isFirstFetch: page == 1));

    repository.fetchPosts(page).then((newPosts) {
      page++;

      final posts = (state as PaginationExample1Loading).oldPosts;
      posts.addAll(newPosts);

      emit(PaginationExample1Loaded(posts));
    });
  }

}