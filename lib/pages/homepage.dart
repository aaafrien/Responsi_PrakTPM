import 'package:flutter/material.dart';
import 'package:responsi_praktpm/pages/news_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://static.republika.co.id/files/images/logo.png")),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => NewsList(category: "terbaru"),
                        )),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        child: Text("TERBARU")),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => NewsList(category: "daerah"),
                        )),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        child: Text("DAERAH")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) =>
                              NewsList(category: "internasional"),
                        )),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        child: Text("INTERNASIONAL")),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => NewsList(category: "islam"),
                        )),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        child: Text("ISLAM")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
