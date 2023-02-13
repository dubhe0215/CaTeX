import 'dart:ui';

import 'package:catex/src/rendering/rendering.dart';

// ignore: public_member_api_docs
class RenderEmpty extends RenderNode {
  // ignore: public_member_api_docs
  RenderEmpty(super.context);

  @override
  void configure() {
    renderSize = Size.zero;
  }

  @override
  void render(Canvas canvas) {}
}
