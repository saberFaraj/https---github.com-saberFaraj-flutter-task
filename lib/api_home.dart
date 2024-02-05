import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class apiHome extends StatefulWidget {
  const apiHome({super.key});

  @override
  State<apiHome> createState() => _apiHomeState();
}

class _apiHomeState extends State<apiHome> {
  bool load = false;
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text(
          "Posts",
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
        ),
      ),
      body: ListView(children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 40,
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.cyanAccent),
          child: InkWell(
            child: Text(
              "Click here",
              style: TextStyle(fontSize: 25),
            ),
            onTap: () async {
              load = true;
              setState(() {});
              var resp = await get(
                  Uri.parse("https://jsonplaceholder.typicode.com/posts"));
              var respobody = jsonDecode(resp.body);
              data.addAll(respobody);
              load = false;
              setState(() {});
            },
          ),
        ),
        if (load)
          Center(
            child: CircularProgressIndicator(),
          ),
        ...List.generate(
            data.length,
            (index) => Card(
                    child: ListTile(
                  title: Text("${data[index]['title']}"),
                  subtitle: Text("${data[index]['body']}"),
                )))
      ]),
    );
  }
}
