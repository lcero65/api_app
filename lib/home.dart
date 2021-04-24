import 'package:flutter/material.dart';
import 'comments_builder.dart' as comments;

class HomeApp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeApp> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test App'),
      ),
      body: Center(
        child: comments.buildFutureBuilder(),
      ),
    );
  }

}

