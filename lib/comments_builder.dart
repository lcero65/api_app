import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'api_call.dart' as apiCall;


FutureBuilder<List> buildFutureBuilder() {

    Future<List<dynamic>> jsonApiList;
    jsonApiList = apiCall.JsonApi().getJSONData();

    return FutureBuilder(
      future: jsonApiList,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
              onRefresh: apiCall.JsonApi().getJSONData,
              child: ListView.separated(
                padding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.8),
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length + 1,
                itemBuilder: (BuildContext _context, int index) {
                  if (index < snapshot.data.length) {
                    return Card(
                        child: ListTile(
                          title: Text(snapshot.data[index]['name'],
                              style: TextStyle(fontSize: 16)),
                          subtitle: Text(snapshot.data[index]['body']),
                          onTap: () {
                            AlertDialog alert = AlertDialog(
                              title: Text(snapshot.data[index]['name'],
                                  style: TextStyle(fontSize: 16)),
                              content: Text(snapshot.data[index]['body']),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('OK')),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                        ));
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Center(child: Text('nothing more to load!')),
                    );
                  }
                },
              ));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }



