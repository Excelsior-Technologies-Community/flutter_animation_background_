import 'dart:math';

class AnimationUtils {
  const AnimationUtils._();

  static double randomDouble(
      Random random,
      double min,
      double max,
      ) {
    return min + random.nextDouble() * (max - min);
  }

  static double randomAngle(Random random) {
    return random.nextDouble() * 2 * pi;
  }

  static double randomOpacity(
      Random random,
      double min,
      double max,
      ) {
    return randomDouble(
      random,
      min,
      max,
    );
  }
}