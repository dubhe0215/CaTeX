import 'package:catex/src/lookup/context.dart';
import 'package:catex/src/lookup/symbols.dart';
import 'package:catex/src/rendering/character.dart';

// ignore: public_member_api_docs
class RenderSymbol extends RenderCharacter {
  // ignore: public_member_api_docs
  RenderSymbol(CaTeXContext context, {required SymbolData data})
      : super(context.copyWith(input: data.unicode));
}
