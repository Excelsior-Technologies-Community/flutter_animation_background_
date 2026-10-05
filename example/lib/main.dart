import 'package:flutter/material.dart';
import 'package:flutter_animation_background/flutter_animation_background.dart';

void main() {
  runApp(const AnimationBackgroundDemo());
}

class AnimationBackgroundDemo extends StatelessWidget {
  const AnimationBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Background',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const AnimationBackgroundHome(),
    );
  }
}

class AnimationBackgroundHome extends StatelessWidget {
  const AnimationBackgroundHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationBackground(
        config: const AnimationBackgroundConfig(
          colors: [
            Color(0xFF6A11CB),
            Color(0xFF2575FC),
          ],
          particleCount: 40,
          particleMinSize: 3,
          particleMaxSize: 10,
          animationSpeed: 1.0,
          particleOpacity: 0.5,
          enableParticles: true,
          enableGradient: true,
          enableFloating: true,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                'Flutter Animation\nBackground',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Create beautiful animated backgrounds '
                    'with particles, gradients and floating effects.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              _FeatureCard(
                icon: Icons.blur_on,
                title: 'Animated Particles',
                description:
                'Add smooth floating particles to your background.',
              ),
              _FeatureCard(
                icon: Icons.gradient,
                title: 'Gradient Background',
                description:
                'Use multiple colors to create beautiful gradients.',
              ),
              _FeatureCard(
                icon: Icons.speed,
                title: 'Animation Speed',
                description:
                'Control the speed of the background animation.',
              ),
              _FeatureCard(
                icon: Icons.tune,
                title: 'Fully Customizable',
                description:
                'Customize particles, opacity, colors and effects.',
              ),
              const SizedBox(height: 20),
              const Text(
                'AnimationBackground',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}