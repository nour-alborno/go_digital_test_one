import 'package:flutter/material.dart';

class One extends StatelessWidget {
  One({Key? key}) : super(key: key);

  List<Map> posts = [
    {
      "image":
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.webp?b=1&s=170667a&w=0&k=20&c=0FSPkjeK1u_EksXE1VrATh7MD74dnFiVmMmaMhtSYwI=",
      'text': "data"
    },
    {
      "image":
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.webp?b=1&s=170667a&w=0&k=20&c=0FSPkjeK1u_EksXE1VrATh7MD74dnFiVmMmaMhtSYwI=",
      'text': "data2"
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Widget x = PostsStructure(e['text'],e['image']);

    return Scaffold(
      appBar: AppBar(title: Text("App Bar")),
      body: ListView(
        children:
            posts.map((e) => PostsStructure(e['text'], e['image'])).toList(),
      ),
    );
  }
}

class PostsStructure extends StatelessWidget {
  String text;
  String img;

  PostsStructure(this.text, this.img);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(img),
        Text(text),
      ],
    );
  }
}
