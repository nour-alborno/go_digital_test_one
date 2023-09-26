import 'package:flutter/material.dart';
import 'package:go_digital_test_one/post_example/post_widget.dart';
import '../data/post_data.dart';
import '../models/post_model.dart';

class PostsScreen extends StatelessWidget {
  List<PostModel> convertMapsToPostmodel() {
    return postsData.map((e) => PostModel(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("My Social Media App"),
      ),
      body: ListView.builder(
          itemCount: postsData.length,
          itemBuilder: (x, i) {
            return PostWidget(convertMapsToPostmodel()[i]);
          }),
    );
  }
}
