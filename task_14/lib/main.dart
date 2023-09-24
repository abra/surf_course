import 'package:flutter/material.dart';

import 'data/post.dart';
import 'data/post_repository_impl.dart';
import 'data/repository.dart';
import 'ui/error_page_widget.dart';
import 'ui/loading_page_widget.dart';
import 'ui/posts_grid_view_widget.dart';

void main() async {
  runApp(Postogram(
    repo: PostRepositoryImpl(),
  ));
}

class Postogram extends StatefulWidget {
  const Postogram({
    super.key,
    required this.repo,
  });

  final Repository repo;

  @override
  State<Postogram> createState() => _PostogramState();
}

class _PostogramState extends State<Postogram> {
  late Future<List<Post>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = widget.repo.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: futureData,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return PostsGridViewWidget(posts: data);
            } else if (snapshot.hasError) {
              return ErrorPageWidget(
                message: snapshot.error.toString(),
              );
            } else {
              return const LoadingPageWidget();
            }
          },
        ),
      ),
    );
  }
}
