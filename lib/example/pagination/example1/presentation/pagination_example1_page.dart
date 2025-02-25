import 'dart:async';
import 'package:example/example/pagination/example1/cubit/pagination_example1_cubit.dart';
import 'package:example/example/pagination/example1/data/models/pagination_example1_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationExample1Page extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PaginationExample1Cubit>(context).loadPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PaginationExample1Cubit>(context).loadPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<PaginationExample1Cubit, PaginationExample1State>(
        builder: (context, state) {
      if (state is PaginationExample1Loading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<PaginationExample1Model> posts = [];
      bool isLoading = false;

      if (state is PaginationExample1Loading) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is PaginationExample1Loaded) {
        posts = state.posts;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < posts.length)
            return _post(posts[index], context);
          else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: posts.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _post(PaginationExample1Model post, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${post.id}. ${post.title}",
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(post.body)
        ],
      ),
    );
  }
}
