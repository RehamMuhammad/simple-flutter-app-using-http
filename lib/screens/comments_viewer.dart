import 'package:flutter/material.dart';
import 'package:json_api_example/controllers/app_controller.dart';

import 'package:json_api_example/models/comment.dart';

class RecipeDetail extends StatefulWidget {
  final int? id;
  const RecipeDetail(this.id, {Key? key}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {

    List<Comment> comments = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var commentsData = await AppContrloller.getComments(widget.id??0);
      print(commentsData);
      setState(() {
        comments = commentsData;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id.toString()),
      ),
         body: comments.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comments[index].name.toString()),
                    subtitle: Text(comments[index].body.toString()),
                  );
                }));
  }
}

