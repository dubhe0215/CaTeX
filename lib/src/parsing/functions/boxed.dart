import 'package:catex/src/lookup/context.dart';
import 'package:catex/src/lookup/functions.dart';
import 'package:catex/src/parsing/parsing.dart';
import 'package:catex/src/rendering/functions/boxed.dart';
import 'package:catex/src/widgets.dart';

// ignore: public_member_api_docs
class BoxedNode extends SingleChildNode<RenderBoxed> with FunctionNode {
  // ignore: public_member_api_docs
  BoxedNode(ParsingContext context) : super(context);

  @override
  FunctionProperties get properties =>
      const FunctionProperties(arguments: 1, greediness: 1);

  @override
  NodeWidget<RenderBoxed> configureWidget(CaTeXContext context) {
    super.configureWidget(context);

    return NodeWidget(
      context,
      createRenderNode,
      children: [child!.createWidget(context)],
    );
  }

  @override
  RenderBoxed createRenderNode(CaTeXContext context) {
    return RenderBoxed(context);
  }
}
