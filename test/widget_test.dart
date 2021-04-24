// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_api_app/home.dart';
import 'package:flutter_api_app/comments_builder.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_api_app/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  group('Widget Type', (){
    testWidgets('See that CircularProgressIndicator widget is in Tree', (WidgetTester tester) async{
        await tester.pumpWidget(MaterialApp(
            home:HomeApp()
           )
        );
        //search through widget tree based on type
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

}
