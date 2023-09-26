class PostModel {
  String? image;
  String? content;
  User? user;
  bool isLiked = false;
  List<String>? comments;


  addComment(String text){
    comments?.add(text);
  }


  PostModel.empty(String comment){
   comments?.add(comment);
  }

  PostModel(Map map) {
    image = map["image"];
    content = map["content"];
    isLiked = map["isFavourite"];
    user = User(map["user"]);
    comments = map["comments"];
  }
}

class User {
  String? imageUrl;
  String? name;
  User(Map map) {
    imageUrl = map["image"];
    name = map["name"];
  }
}
