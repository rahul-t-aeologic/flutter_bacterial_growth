import 'package:flutter/widgets.dart';

import 'bacteria_growth_history_element.dart';

class BacteriaGrowthChartPainter extends CustomPainter {
  const BacteriaGrowthChartPainter({
    required this.historyElements,
    required this.currentTick,
    required this.currentBacteriaAmount,
  });

  final List<BacteriaGrowthHistoryElement> historyElements;
  final int currentTick;
  final int currentBacteriaAmount;

  @override
  void paint(Canvas canvas, Size size) {
    final double dotSize = size.height / 60;
    final Paint paint = Paint();

    for (int i = 0; i < historyElements.length; i++) {
      final BacteriaGrowthHistoryElement element = historyElements[i];
      final double x = element.tickNumber / currentTick * size.width;
      final double y =
          element.amountOfBacteria / currentBacteriaAmount * size.height;

      if (i == 0) continue;

      final BacteriaGrowthHistoryElement previousElement =
      historyElements[i - 1];
      final double previousX =
          previousElement.tickNumber / currentTick * size.width;
      final double previousY = previousElement.amountOfBacteria /
          currentBacteriaAmount *
          size.height;

      paint.strokeWidth = dotSize;

      canvas.drawLine(
        Offset(previousX, size.height - previousY),
        Offset(x, size.height - y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}