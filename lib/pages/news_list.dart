import 'package:flutter/material.dart';
import 'package:responsi_praktpm/models/list_news_model.dart';
import 'package:responsi_praktpm/pages/news_detail.dart';
import 'package:responsi_praktpm/services/base_network.dart';

class NewsList extends StatelessWidget {
  final String category;
  const NewsList({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = category.toUpperCase();
    return Scaffold(
      appBar: AppBar(
        title: Text("REPUBLIKA " + title),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: BaseNetwork.get(category),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return Center(child: Text("No Data"));
            } else {
              ListNewsModel news = ListNewsModel.fromJson(snapshot.data);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < news.data!.posts!.length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetail(posts: news.data!.posts![i])));
                        },
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  news.data!.posts![i].title!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 180,
                                height: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            news.data!.posts![i].thumbnail!),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4))),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              );
            }
          }),
    );
  }
}
