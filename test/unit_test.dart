import 'package:flutter/material.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'package:flutter_api_app/home.dart';
import 'package:flutter_api_app/comments_builder.dart' as comment;
import 'package:flutter_api_app/api_call.dart' ;
import 'package:http/http.dart' as http;

void main(){
  var apiCall = JsonApi();
  setUp((){
    apiCall = JsonApi();
  });

  test("HTTP request", () async {
    final result = await http.get(Uri.https('jsonplaceholder.typicode.com', 'comments'));
    expect(result.statusCode, 200);
  });

  test('Return id of first comment', () async {
    final _data = await apiCall.getJSONData();
    expect(_data[1]['id'], 2);
  });
  test('Return name of first comment', () async {
    final _data = await apiCall.getJSONData();
    expect(_data[1]['name'], 'quo vero reiciendis velit similique earum');
  });

}