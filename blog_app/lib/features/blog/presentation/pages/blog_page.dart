import 'package:blog_app/features/blog/presentation/pages/add_new_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => BlogPage(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLOG'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddNewBlogPage.route());
            },
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          ),
        ],
      ),
    );
  }
}
