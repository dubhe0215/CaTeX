import 'dart:ui';

import 'package:catex/src/rendering/rendering.dart';

/// [RenderNode] for [CancelNode].
class RenderCancel extends RenderNode {
  /// Constructs a [RenderCancel] given a [context].
  RenderCancel(super.context);

  @override
  void configure() {
    renderSize = sizeChildNode(children[0]);
  }

  @override
  void render(Canvas canvas) {
    final linePaint = Paint()
      ..strokeWidth = 2
      ..color = context.color!;

    paintChildNode(children[0]);
    final horizontalPadding = renderSize!.width * .05;
    final verticalPadding = renderSize!.height * .05;

    canvas.drawLine(
      Offset(renderSize!.width - horizontalPadding, verticalPadding),
      Offset(horizontalPadding, renderSize!.height - verticalPadding),
      linePaint,
    );
  }
}
