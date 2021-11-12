import 'package:flutter/material.dart';
import 'package:json_api_example/controllers/app_controller.dart';
import 'package:json_api_example/screens/comments_viewer.dart';

import 'models/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> postDataList = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var postData = await AppContrloller.getPosts();
      setState(() {
        postDataList = postData;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api Tester'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          ],
        ),
        body: postDataList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: postDataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {

                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                RecipeDetail(postDataList[index].id)));
                     // print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm ${index}');
                    },
                    title: Text(postDataList[index].title.toString()),
                    subtitle: Text(postDataList[index].body.toString()),
                  );
                }));
  }
}
