

import 'package:flutter/material.dart';
import 'package:go_digital_test_one/data/post_data.dart';
import 'package:go_digital_test_one/models/post_model.dart';

class PostsExercise extends StatefulWidget {
  const PostsExercise({Key? key}) : super(key: key);

  @override
  State<PostsExercise> createState() => _PostsExerciseState();
}

class _PostsExerciseState extends State<PostsExercise> {
  List<PostModel>? postModel;

  TextEditingController controller = TextEditingController();

  PostModelConverter(){
    postModel = postsData.map((e) => PostModel(e)).toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostModelConverter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: postModel?.length ?? 0,
        itemBuilder: (context, index) {
        return Container(

          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(postModel?[index].image ?? "",width: double.infinity,height: 200,),

              Row(
                children: [
                  Icon(Icons.favorite,
                    size: 16,
                  color: postModel?[index].isLiked ?? false ? Colors.red : Colors.grey ,),
                  SizedBox(width: 10,),

                  Icon(Icons.comment,color: Colors.blue, size: 16,),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: postModel?[index].comments?.length ?? 0,
                    itemBuilder: (context, index2) {
                      return Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(postModel![index].comments?[index2] ?? "" ));
                    },),
              ),

              SizedBox(
                height: 0,
              ),

              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Add a comment",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          print(controller.text);
                          postModel?[index].comments?.add(controller.text);
                          controller.text = "";
                        }
                        );
                      },
                      child: Icon(Icons.near_me, color: Colors.blue,size: 14,)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),)
                ),
              )
            ],
          ),
        );
      },)
    );
  }
}
