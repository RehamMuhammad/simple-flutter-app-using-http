import 'package:flutter/material.dart';
import 'package:json_api_example/controllers/app_controller.dart';

import 'package:json_api_example/models/comment.dart';

class CommentsViewer extends StatefulWidget {
  final int? id;
  const CommentsViewer(this.id, {Key? key}) : super(key: key);

  @override
  _CommentsViewerState createState() => _CommentsViewerState();
}

class _CommentsViewerState extends State<CommentsViewer> {
  List<Comment> comments = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var commentsData = await AppContrloller.getComments(widget.id ?? 0);
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
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(comments[index].name.toString()),
                      subtitle: Text(comments[index].body.toString()),
                      trailing: Text(comments[index].email.toString()),
                    ),
                  );
                }));
  }
}

