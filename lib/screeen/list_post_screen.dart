import 'package:app1/database/database_helpert.dart';
import 'package:app1/widgets/item_post_widget.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class ListPostScreen extends StatefulWidget {
  const ListPostScreen({super.key});

  @override
  State<ListPostScreen> createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> {
  DatabaseHelper? helper;
  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: helper!.GETALLPOST(),
        builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var objPostModel = snapshot.data![index];
                return ItemPostWidget(postModel: objPostModel);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(' Somenting was wrong'),
            );
          } else {
            return Center(
              child: Text(' Somenting was wrong'),
            );
          }
        });
  }
}
