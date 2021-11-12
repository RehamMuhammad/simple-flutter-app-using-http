import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_api_example/controllers/app_controller.dart';
import 'package:json_api_example/models/post.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final title = TextEditingController();
  final body = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create New Post"),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Post Title',
                    hintText: 'Enter Post Title'),
              ),
              TextField(
                controller: body,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Post body',
                    hintText: 'Enter Post body'),
              ),
              SizedBox(
                  child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: Text(
                  'Add Post',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  var newPost = Post(
                    userId: 5,
                    id: 4,
                    title: title.text,
                    body: body.text,
                  );
                  await AppContrloller.sendPosts(body: newPost.toJson());
                },
              )),
            ],
          ),
        )));
  }
}
