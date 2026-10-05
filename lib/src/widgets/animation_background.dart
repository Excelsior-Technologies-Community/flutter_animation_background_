import 'dart:math';

import 'package:flutter/material.dart';

import '../models/animation_background_config.dart';
import '../utils/animation_utils.dart';

class AnimationBackground extends StatefulWidget {
  final Widget child;
  final AnimationBackgroundConfig config;

  const AnimationBackground({
    super.key,
    required this.child,
    this.config = const AnimationBackgroundConfig(),
  });

  @override
  State<AnimationBackground> createState() =>
      _AnimationBackgroundState();
}

class _AnimationBackgroundState
    extends State<AnimationBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;

  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (60000 / widget.config.animationSpeed).round(),
      ),
    )..repeat();

    _particles = _createParticles();
  }

  List<_Particle> _createParticles() {
    return List.generate(
      widget.config.particleCount,
          (_) {
        return _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          size: AnimationUtils.randomDouble(
            _random,
            widget.config.particleMinSize,
            widget.config.particleMaxSize,
          ),
          speed: AnimationUtils.randomDouble(
            _random,
            1.0,
            2.5,
          ),
          angle: AnimationUtils.randomAngle(_random),
          opacity: AnimationUtils.randomOpacity(
            _random,
            widget.config.particleOpacity * 0.5,
            widget.config.particleOpacity,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            if (widget.config.enableParticles)
              _buildParticles(),
            widget.child,
          ],
        );
      },
      child: widget.child,
    );
  }

  Widget _buildBackground() {
    if (!widget.config.enableGradient) {
      return const SizedBox.shrink();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.config.colors,
          begin: widget.config.begin,
          end: widget.config.end,
        ),
      ),
    );
  }

  Widget _buildParticles() {
    return IgnorePointer(
      child: CustomPaint(
        painter: _ParticlePainter(
          particles: _particles,
          progress: _controller.value,
          colors: widget.config.colors,
          enableFloating: widget.config.enableFloating,
        ),
      ),
    );
  }
}

class _Particle {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double angle;
  final double opacity;

  const _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.angle,
    required this.opacity,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final List<Color> colors;
  final bool enableFloating;

  const _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.colors,
    required this.enableFloating,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    for (var i = 0; i < particles.length; i++) {
      final particle = particles[i];

      double x = particle.x * size.width;
      double y = particle.y * size.height;

      if (enableFloating) {
        final movement =
            sin(
              (progress * 2 * pi * particle.speed) +
                  particle.angle,
            ) *
                45;

        final verticalMovement =
            cos(
              (progress * 2 * pi * particle.speed) +
                  particle.angle,
            ) *
                35;

        x += movement;
        y += verticalMovement;
      }

      if (x < -particle.size) {
        x = size.width + particle.size;
      }

      if (x > size.width + particle.size) {
        x = -particle.size;
      }

      if (y < -particle.size) {
        y = size.height + particle.size;
      }

      if (y > size.height + particle.size) {
        y = -particle.size;
      }

      final color = colors[i % colors.length];

      final paint = Paint()
        ..color = color.withValues(
          alpha: particle.opacity,
        )
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(x, y),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _ParticlePainter oldDelegate,
      ) {
    return oldDelegate.progress != progress ||
        oldDelegate.enableFloating != enableFloating;
  }
}