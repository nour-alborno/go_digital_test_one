import 'package:flutter/material.dart';
import 'package:go_digital_test_one/data/post_data.dart';

import '../models/post_model.dart';

class PostsProvider extends ChangeNotifier {


  List<PostModel> data = postsData.map((e) => PostModel(e)).toList();

  toggleFav(PostModel postModel){
    postModel.isLiked = !postModel.isLiked;
    notifyListeners();
  }
}