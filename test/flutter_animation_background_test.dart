import 'package:flutter/material.dart';
import 'package:flutter_animation_background/flutter_animation_background.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'AnimationBackground renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AnimationBackground(
            child: const Center(
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

  test(
    'AnimationBackgroundConfig has correct default values',
        () {
      const config = AnimationBackgroundConfig();

      expect(config.particleCount, 30);
      expect(config.particleMinSize, 3.0);
      expect(config.particleMaxSize, 10.0);
      expect(config.animationSpeed, 1.0);
      expect(config.particleOpacity, 0.5);
      expect(config.enableParticles, isTrue);
      expect(config.enableGradient, isTrue);
      expect(config.enableFloating, isTrue);
    },
  );
}