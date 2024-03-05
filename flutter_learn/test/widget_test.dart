import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Calculator Test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byKey(Key("Result")), findsOneWidget);

    final d1 = find.byKey(Key("TextField One"));
    final d2 = find.byKey(Key("TextField Two"));

    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    await tester.enterText(find.byKey(Key("TextField One")), "200");
    await tester.enterText(find.byKey(Key("TextField Two")), "800");

    await tester.tap(find.byIcon(CupertinoIcons.add));
    await tester.pump();

    expect(find.text("1000"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    expect(find.text("-600"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.multiply));
    await tester.pump();

    expect(find.text("160000"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.divide));
    await tester.pump();

    expect(find.text("0.25"), findsOneWidget);
  });
}