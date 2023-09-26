import 'package:flutter/cupertino.dart';
import 'package:go_digital_test_one/data/posts_provider.dart';
import 'package:go_digital_test_one/models/post_model.dart';
import 'package:provider/provider.dart';

import '../../post_example/post_widget.dart';

class FavScreen extends StatelessWidget {
   const FavScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Selector<PostsProvider,List<PostModel>>(
      selector: (context,x) {
        return x.data;
      },
      builder: (context, value, Widget? child) {
        return ListView.builder(
            itemCount: value.where((element) => element.isLiked).length,
            itemBuilder: (x, i) {
              return PostWidget(value.where((element) => element.isLiked).toList()[i]);
            });
      },
    );
  }
}
