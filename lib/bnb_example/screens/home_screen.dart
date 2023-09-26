import 'package:flutter/cupertino.dart';
import 'package:go_digital_test_one/data/posts_provider.dart';
import 'package:provider/provider.dart';

import '../../data/post_data.dart';
import '../../post_example/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (BuildContext context, value, Widget? child) {
       return ListView.builder(
           itemCount: value.data.length ,
           itemBuilder: (x, i) {
             return PostWidget(value.data[i]);
           });
      }
    );
  }
}
