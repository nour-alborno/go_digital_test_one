import 'package:flutter/material.dart';
import 'package:go_digital_test_one/data/posts_provider.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';

class PostWidget extends StatefulWidget {
 final PostModel postModel;
 const PostWidget(this.postModel, {super.key});


  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  toggleIsLike(PostModel postModel) {

  //  widget.postModel.isLiked = !(widget.postModel.isLiked );
    Provider.of<PostsProvider>(context).toggleFav(postModel);
    // setState(() {
    // });
   // if(widget.function != null) widget.function!();


  }

  bool changeState(){

    setState(() {
      widget.postModel.isLiked ? widget.postModel.isLiked = true : widget.postModel.isLiked = false;

    });

    return widget.postModel.isLiked;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onDoubleTap: () {
            //  toggleIsLike(widget.postModel);
              Provider.of<PostsProvider>(context,listen: false).toggleFav(widget.postModel);
            },
            child: Image.network(
              widget.postModel.image ?? '',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (x, y, z) {
                return Container(
                    color: Colors.grey,
                    height: 180,
                    width: double.infinity,
                    child: const Icon(Icons.image));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<PostsProvider>(context,listen: false).toggleFav(widget.postModel);
//                    changeState();

                  },
                  child: Icon(
                    Icons.favorite,
                    color:
                    (widget.postModel.isLiked) ? Colors.red : Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.postModel.content ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
