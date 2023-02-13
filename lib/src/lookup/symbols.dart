export 'generated/symbols.g.dart';

// ignore: public_member_api_docs
enum SymbolFont {
  // ignore: public_member_api_docs
  main,
  // ignore: public_member_api_docs
  ams,
}

// ignore: public_member_api_docs
enum SymbolGroup {
  // ignore: public_member_api_docs
  accent,
  // ignore: public_member_api_docs
  bin,
  // ignore: public_member_api_docs
  close,
  // ignore: public_member_api_docs
  inner,
  // ignore: public_member_api_docs
  mathord,
  // ignore: public_member_api_docs
  op,
  // ignore: public_member_api_docs
  open,
  // ignore: public_member_api_docs
  punct,
  // ignore: public_member_api_docs
  rel,
  // ignore: public_member_api_docs
  spacing,
  // ignore: public_member_api_docs
  textord,
}

// ignore: public_member_api_docs
class SymbolData {
  // ignore: public_member_api_docs
  const SymbolData(
    this.unicode,
    this.font,
    this.group,
  );

  // ignore: public_member_api_docs
  final SymbolFont font;
  // ignore: public_member_api_docs
  final SymbolGroup group;
  // ignore: public_member_api_docs
  final String? unicode;
}
