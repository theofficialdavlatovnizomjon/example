import 'package:example/example/pagination/example1/data/models/pagination_example1_model.dart';
import 'package:example/example/pagination/example1/data/services/pagination_example1_servise.dart';

class PaginationExample1Repository {
  final PaginationExample1Servise service;

  PaginationExample1Repository(this.service);

  Future<List<PaginationExample1Model>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);
    return posts.map((e) => PaginationExample1Model.fromJson(e)).toList();
  }
}
