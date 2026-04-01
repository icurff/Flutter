import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab9/main.dart';

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyApp(
        home: Scaffold(
          body: Text('test-home'),
        ),
      ),
    );

    expect(find.byType(MyApp), findsOneWidget);
    expect(find.text('test-home'), findsOneWidget);
  });
}
