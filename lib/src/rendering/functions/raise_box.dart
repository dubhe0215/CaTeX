import 'package:catex/src/parsing/functions/raise_box.dart';
import 'package:catex/src/rendering/rendering.dart';

/// [RenderNode] for [RaiseBoxNode].
class RenderRaiseBox extends RenderNode with SingleChildRenderNodeMixin {
  /// Constructs a [RenderRaiseBox] given a [context].
  RenderRaiseBox(
    super.context, {
    required this.shift,
  });

  /// Vertical shift of the raise box in pixels.
  ///
  /// This has the opposite sign of the raise value specified in the input
  /// as the box is supposed to **raise** based on the value.
  final double shift;
}
