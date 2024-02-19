import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("HELLO test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(Container), findsOneWidget);
  });
}