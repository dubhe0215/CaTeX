/// The 8 different styles (display, text, script, scriptscript,
/// and cramped versions).
///
/// See *The TeXbook* from page 140 for the different styles.
/// The actual names are T', S', etc. for the cramped styles, however,
/// Dart does not allow the prime symbol for variable names.
enum CaTeXStyle {
  // ignore: public_member_api_docs
  d,
  // ignore: public_member_api_docs
  dc,
  // ignore: public_member_api_docs
  t,
  // ignore: public_member_api_docs
  tc,
  // ignore: public_member_api_docs
  s,
  // ignore: public_member_api_docs
  sc,
  // ignore: public_member_api_docs
  ss,
  // ignore: public_member_api_docs
  ssc,
}

// todo(creativecreatorormaybenot): support this.
// ignore: public_member_api_docs
class CaTeXStyleData {
  // Ignore the warning until this is implemented.
  // ignore: public_member_api_docs
  const CaTeXStyleData(this.id, this.size, {required this.cramped});

  // ignore: public_member_api_docs
  final int id;
  // ignore: public_member_api_docs
  final int size;
  // ignore: public_member_api_docs
  final bool cramped;

  // ignore: public_member_api_docs
  CaTeXStyleData? get sup => styles[_sup[id]];

  // ignore: public_member_api_docs
  CaTeXStyleData? get sub => styles[_sub[id]];

  // ignore: public_member_api_docs
  CaTeXStyleData? get fracNum => styles[_fracNum[id]];

  // ignore: public_member_api_docs
  CaTeXStyleData? get fracDen => styles[_fracDen[id]];

  // ignore: public_member_api_docs
  CaTeXStyleData? get cramp => styles[_cramp[id]];

  // ignore: public_member_api_docs
  CaTeXStyleData? get text => styles[_text[id]];

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;

    if (other is CaTeXStyleData) {
      return other.id == id && other.size == size && other.cramped == cramped;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode ^ size.hashCode ^ cramped.hashCode;
}

/// Lookup tables based on https://github.com/KaTeX/KaTeX/blob/fa8fbc0c18e5e3fe98f347ceed3a48699d561c72/src/Style.js.
const List<CaTeXStyle> _sup = [
  CaTeXStyle.s,
  CaTeXStyle.sc,
  CaTeXStyle.s,
  CaTeXStyle.sc,
  CaTeXStyle.ss,
  CaTeXStyle.ssc,
  CaTeXStyle.ss,
  CaTeXStyle.ssc,
];
const List<CaTeXStyle> _sub = [
  CaTeXStyle.sc,
  CaTeXStyle.sc,
  CaTeXStyle.sc,
  CaTeXStyle.sc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
];
const List<CaTeXStyle> _fracNum = [
  CaTeXStyle.t,
  CaTeXStyle.tc,
  CaTeXStyle.s,
  CaTeXStyle.sc,
  CaTeXStyle.ss,
  CaTeXStyle.ssc,
  CaTeXStyle.ss,
  CaTeXStyle.ssc,
];
const List<CaTeXStyle> _fracDen = [
  CaTeXStyle.tc,
  CaTeXStyle.tc,
  CaTeXStyle.sc,
  CaTeXStyle.sc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
];
const List<CaTeXStyle> _cramp = [
  CaTeXStyle.dc,
  CaTeXStyle.dc,
  CaTeXStyle.tc,
  CaTeXStyle.tc,
  CaTeXStyle.sc,
  CaTeXStyle.sc,
  CaTeXStyle.ssc,
  CaTeXStyle.ssc,
];
const List<CaTeXStyle> _text = [
  CaTeXStyle.d,
  CaTeXStyle.dc,
  CaTeXStyle.t,
  CaTeXStyle.tc,
  CaTeXStyle.t,
  CaTeXStyle.tc,
  CaTeXStyle.t,
  CaTeXStyle.tc,
];

// ignore: public_member_api_docs
const styles = <CaTeXStyle, CaTeXStyleData>{
  CaTeXStyle.d: CaTeXStyleData(0, 0, cramped: false),
  CaTeXStyle.dc: CaTeXStyleData(1, 0, cramped: true),
  CaTeXStyle.t: CaTeXStyleData(2, 1, cramped: false),
  CaTeXStyle.tc: CaTeXStyleData(3, 1, cramped: true),
  CaTeXStyle.s: CaTeXStyleData(4, 2, cramped: false),
  CaTeXStyle.sc: CaTeXStyleData(5, 2, cramped: true),
  CaTeXStyle.ss: CaTeXStyleData(6, 3, cramped: false),
  CaTeXStyle.ssc: CaTeXStyleData(7, 3, cramped: true),
};

/// [CaTeXStyleData] for [CaTeXStyle.d].
final displayStyle = styles[CaTeXStyle.d];

/// [CaTeXStyleData] for [CaTeXStyle.dc].
final crampedDisplayStyle = styles[CaTeXStyle.dc];

/// [CaTeXStyleData] for [CaTeXStyle.d].
final textStyle = styles[CaTeXStyle.t];

/// [CaTeXStyleData] for [CaTeXStyle.tc].
final crampedTextStyle = styles[CaTeXStyle.tc];

/// [CaTeXStyleData] for [CaTeXStyle.s].
final scriptStyle = styles[CaTeXStyle.s];

/// [CaTeXStyleData] for [CaTeXStyle.sc].
final crampedScriptStyle = styles[CaTeXStyle.sc];

/// [CaTeXStyleData] for [CaTeXStyle.ss].
final scriptScriptStyle = styles[CaTeXStyle.ss];

/// [CaTeXStyleData] for [CaTeXStyle.ssc].
final crampedScriptScriptStyle = styles[CaTeXStyle.ssc];
