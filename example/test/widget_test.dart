import 'package:flutter/material.dart';
import 'package:flutter_animation_background/flutter_animation_background.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Animation Background example renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimationBackground(
            child: Center(
              child: Text(
                'Animation Background',
              ),
            ),
          ),
        ),
      );

      expect(
        find.text('Animation Background'),
        findsOneWidget,
      );
    },
  );
}