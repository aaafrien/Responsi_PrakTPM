import 'package:flutter/material.dart';
import 'package:responsi_praktpm/models/list_news_model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final Posts posts;
  const NewsDetail({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentDate =
        DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(posts.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            ),
            SizedBox(height: 20),
            Text(currentDate),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(posts.thumbnail!),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 20),
            Text(
              posts.description!,
              textAlign: TextAlign.justify,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async {
                    await urlLaunch(posts.link!);
                  },
                  child: Text("Baca Selengkapnya..."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> urlLaunch(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
