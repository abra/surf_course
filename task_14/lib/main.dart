import 'package:flutter/material.dart';

import 'data/post.dart';
import 'data/post_repository_impl.dart';
import 'data/repository.dart';
import 'ui/constants.dart';
import 'ui/posts_grid_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
              return PostsGridView(posts: data);
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Image.asset(appLogo),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
