import 'package:flutter/material.dart';

class AnimationBackgroundConfig {
  final List<Color> colors;
  final int particleCount;
  final double particleMinSize;
  final double particleMaxSize;
  final double animationSpeed;
  final double particleOpacity;
  final bool enableParticles;
  final bool enableGradient;
  final bool enableFloating;
  final Alignment begin;
  final Alignment end;

  const AnimationBackgroundConfig({
    this.colors = const [
      Color(0xFF6A11CB),
      Color(0xFF2575FC),
    ],
    this.particleCount = 30,
    this.particleMinSize = 3.0,
    this.particleMaxSize = 10.0,
    this.animationSpeed = 5.0,
    this.particleOpacity = 0.5,
    this.enableParticles = true,
    this.enableGradient = true,
    this.enableFloating = true,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  })  : assert(
  particleCount >= 0,
  'particleCount cannot be negative.',
  ),
        assert(
        particleMinSize >= 0,
        'particleMinSize cannot be negative.',
        ),
        assert(
        particleMaxSize >= particleMinSize,
        'particleMaxSize cannot be smaller than particleMinSize.',
        ),
        assert(
        animationSpeed > 0,
        'animationSpeed must be greater than 0.',
        ),
        assert(
        particleOpacity >= 0 && particleOpacity <= 1,
        'particleOpacity must be between 0 and 1.',
        );
}