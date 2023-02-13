import 'dart:io';

import 'package:catex/src/lookup/modes.dart';
import 'package:catex/src/lookup/symbols.dart';
import 'package:path/path.dart' as p;

final header = '''
import 'package:catex/src/lookup/modes.dart';
import 'package:catex/src/lookup/symbols.dart';

/// This file was automatically generated - do not edit manually.
/// See `gen/symbols.dart` instead.

const symbols = <$CaTeXMode, Map<$String, $SymbolData>>{''';

/// Writes the code for supported symbols to a file called `symbols.g.dart`.
///
/// The directory is determined by the path specified as the first argument.
Future<void> main(List<String> args) async {
  final file = File(p.join(args.first, 'symbols.g.dart'));

  // This makes sure the code does not run for nothing.
  if (file.existsSync()) file.deleteSync();
  file.createSync();

  final List<String> lines = [...header.split('\\n')];
  final List<String> mathSymbols = [];
  final List<String> textSymbols = [];

  const math = 'math';
  const text = 'text';
  const main = 'main';
  const ams = 'ams';
  const accent = 'accent';
  const bin = 'bin';
  const close = 'close';
  const inner = 'inner';
  const mathord = 'mathord';
  const op = 'op';
  const open = 'open';
  const punct = 'punct';
  const rel = 'rel';
  const spacing = 'spacing';
  const textord = 'textord';

  void defineSymbol(
    String mode,
    String font,
    String group,
    String? unicode,
    String name, {
    bool createUnicodeEntry = false,
  }) {
    assert(
      mode.isNotEmpty == true &&
          font.isNotEmpty == true &&
          group.isNotEmpty == true &&
          (unicode == null || unicode.isNotEmpty == true) &&
          name.isNotEmpty == true,
      'Input `defineSymbol($mode, $font, $group, $unicode, $name)` is invalid.',
    );

    (mode == math ? mathSymbols : textSymbols)
        .add("    ${name.contains("'") ? '"$name"' : "'$name'"}: "
            "$SymbolData(${unicode != null ? "'$unicode'" : null}, "
            '$SymbolFont.$font, $SymbolGroup.$group),');

    if (unicode != null && createUnicodeEntry) {
      (mode == math ? mathSymbols : textSymbols)
          .add("    '$unicode': $SymbolData('$unicode', "
              "$SymbolFont.$font, $SymbolGroup.$group),");
    }
  }

  /// This is based on https://github.com/KaTeX/KaTeX/blob/c8c7c3954c4c3e2a3e0499a1fd52e9c66e286462/src/symbols.js.
  defineSymbol(
    math,
    main,
    rel,
    "\\u2261",
    "\\\\equiv",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u2260", "\\\\neq", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    rel,
    "\\u227a",
    "\\\\prec",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u227b",
    "\\\\succ",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u223c", "\\\\sim", createUnicodeEntry: true);
  defineSymbol(math, main, rel, "\\u22a5", "\\\\perp");
  defineSymbol(
    math,
    main,
    rel,
    "\\u2aaf",
    "\\\\preceq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2ab0",
    "\\\\succeq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2243",
    "\\\\simeq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u2223", "\\\\mid", createUnicodeEntry: true);
  defineSymbol(math, main, rel, "\\u226a", "\\\\ll", createUnicodeEntry: true);
  defineSymbol(math, main, rel, "\\u226b", "\\\\gg", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    rel,
    "\\u224d",
    "\\\\asymp",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u2225", "\\\\parallel");
  defineSymbol(
    math,
    main,
    rel,
    "\\u22c8",
    "\\\\bowtie",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2323",
    "\\\\smile",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2291",
    "\\\\sqsubseteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2292",
    "\\\\sqsupseteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2250",
    "\\\\doteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2322",
    "\\\\frown",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u220b", "\\\\ni", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    rel,
    "\\u221d",
    "\\\\propto",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u22a2",
    "\\\\vdash",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u22a3",
    "\\\\dashv",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u220b", "\\\\owns");
  defineSymbol(math, main, punct, "\\u002e", "\\\\ldotp");
  defineSymbol(math, main, punct, "\\u22c5", "\\\\cdotp");
  defineSymbol(math, main, textord, "\\u0023", "\\\\#");
  defineSymbol(text, main, textord, "\\u0023", "\\\\#");
  defineSymbol(math, main, textord, "\\u0026", "\\\\&");
  defineSymbol(text, main, textord, "\\u0026", "\\\\&");
  defineSymbol(
    math,
    main,
    textord,
    "\\u2135",
    "\\\\aleph",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2200",
    "\\\\forall",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u210f",
    "\\\\hbar",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2203",
    "\\\\exists",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2207",
    "\\\\nabla",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u266d",
    "\\\\flat",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2113",
    "\\\\ell",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u266e",
    "\\\\natural",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2663",
    "\\\\clubsuit",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2118",
    "\\\\wp",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u266f",
    "\\\\sharp",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2662",
    "\\\\diamondsuit",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u211c",
    "\\\\Re",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2661",
    "\\\\heartsuit",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2111",
    "\\\\Im",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2660",
    "\\\\spadesuit",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00a7",
    "\\\\S",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00b6",
    "\\\\P",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, textord, "\\u2020", "\\\\dag");
  defineSymbol(text, main, textord, "\\u2020", "\\\\dag");
  defineSymbol(text, main, textord, "\\u2020", "\\\\textdagger");
  defineSymbol(math, main, textord, "\\u2021", "\\\\ddag");
  defineSymbol(text, main, textord, "\\u2021", "\\\\ddag");
  defineSymbol(text, main, textord, "\\u2021", "\\\\textdaggerdbl");
  defineSymbol(
    math,
    main,
    close,
    "\\u23b1",
    "\\\\rmoustache",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    open,
    "\\u23b0",
    "\\\\lmoustache",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    close,
    "\\u27ef",
    "\\\\rgroup",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    open,
    "\\u27ee",
    "\\\\lgroup",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u2213", "\\\\mp", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    bin,
    "\\u2296",
    "\\\\ominus",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    bin,
    "\\u228e",
    "\\\\uplus",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    bin,
    "\\u2293",
    "\\\\sqcap",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u2217", "\\\\ast");
  defineSymbol(
    math,
    main,
    bin,
    "\\u2294",
    "\\\\sqcup",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u25ef", "\\\\bigcirc");
  defineSymbol(math, main, bin, "\\u2219", "\\\\bullet");
  defineSymbol(math, main, bin, "\\u2021", "\\\\ddagger");
  defineSymbol(math, main, bin, "\\u2240", "\\\\wr", createUnicodeEntry: true);
  defineSymbol(math, main, bin, "\\u2a3f", "\\\\amalg");
  defineSymbol(math, main, bin, "\\u0026", "\\\\And"); // from amsmath
  defineSymbol(
    math,
    main,
    rel,
    "\\u27f5",
    "\\\\longleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21d0",
    "\\\\Leftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u27f8",
    "\\\\Longleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u27f6",
    "\\\\longrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21d2",
    "\\\\Rightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u27f9",
    "\\\\Longrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2194",
    "\\\\leftrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u27f7",
    "\\\\longleftrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21d4",
    "\\\\Leftrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u27fa",
    "\\\\Longleftrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21a6",
    "\\\\mapsto",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u27fc",
    "\\\\longmapsto",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2197",
    "\\\\nearrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21a9",
    "\\\\hookleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21aa",
    "\\\\hookrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2198",
    "\\\\searrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21bc",
    "\\\\leftharpoonup",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21c0",
    "\\\\rightharpoonup",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2199",
    "\\\\swarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21bd",
    "\\\\leftharpoondown",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21c1",
    "\\\\rightharpoondown",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2196",
    "\\\\nwarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21cc",
    "\\\\rightleftharpoons",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u226e",
    "\\\\nless",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue010", "\\\\@nleqslant");
  defineSymbol(math, ams, rel, "\\ue011", "\\\\@nleqq");
  defineSymbol(math, ams, rel, "\\u2a87", "\\\\lneq", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2268",
    "\\\\lneqq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue00c", "\\\\@lvertneqq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22e6",
    "\\\\lnsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a89",
    "\\\\lnapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2280",
    "\\\\nprec",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22e0",
    "\\\\npreceq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22e8",
    "\\\\precnsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ab9",
    "\\\\precnapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u2241", "\\\\nsim", createUnicodeEntry: true);
  defineSymbol(math, ams, rel, "\\ue006", "\\\\@nshortmid");
  defineSymbol(math, ams, rel, "\\u2224", "\\\\nmid", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22ac",
    "\\\\nvdash",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22ad",
    "\\\\nvDash",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u22ea", "\\\\ntriangleleft");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22ec",
    "\\\\ntrianglelefteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u228a",
    "\\\\subsetneq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue01a", "\\\\@varsubsetneq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2acb",
    "\\\\subsetneqq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue017", "\\\\@varsubsetneqq");
  defineSymbol(math, ams, rel, "\\u226f", "\\\\ngtr", createUnicodeEntry: true);
  defineSymbol(math, ams, rel, "\\ue00f", "\\\\@ngeqslant");
  defineSymbol(math, ams, rel, "\\ue00e", "\\\\@ngeqq");
  defineSymbol(math, ams, rel, "\\u2a88", "\\\\gneq", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2269",
    "\\\\gneqq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue00d", "\\\\@gvertneqq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22e7",
    "\\\\gnsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a8a",
    "\\\\gnapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2281",
    "\\\\nsucc",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22e1",
    "\\\\nsucceq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22e9",
    "\\\\succnsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2aba",
    "\\\\succnapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2246",
    "\\\\ncong",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue007", "\\\\@nshortparallel");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2226",
    "\\\\nparallel",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22af",
    "\\\\nVDash",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u22eb", "\\\\ntriangleright");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22ed",
    "\\\\ntrianglerighteq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue018", "\\\\@nsupseteqq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u228b",
    "\\\\supsetneq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue01b", "\\\\@varsupsetneq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2acc",
    "\\\\supsetneqq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue019", "\\\\@varsupsetneqq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22ae",
    "\\\\nVdash",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ab5",
    "\\\\precneqq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ab6",
    "\\\\succneqq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\ue016", "\\\\@nsubseteqq");
  defineSymbol(math, ams, bin, "\\u22b4", "\\\\unlhd");
  defineSymbol(math, ams, bin, "\\u22b5", "\\\\unrhd");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u219a",
    "\\\\nleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u219b",
    "\\\\nrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21cd",
    "\\\\nLeftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21cf",
    "\\\\nRightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ae",
    "\\\\nleftrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ce",
    "\\\\nLeftrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u25b3", "\\\\vartriangle");
  defineSymbol(math, ams, textord, "\\u210f", "\\\\hslash");
  defineSymbol(math, ams, textord, "\\u25bd", "\\\\triangledown");
  defineSymbol(math, ams, textord, "\\u25ca", "\\\\lozenge");
  defineSymbol(math, ams, textord, "\\u24c8", "\\\\circledS");
  defineSymbol(math, ams, textord, "\\u00ae", "\\\\circledR");
  defineSymbol(text, ams, textord, "\\u00ae", "\\\\circledR");
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2221",
    "\\\\measuredangle",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, textord, "\\u2204", "\\\\nexists");
  defineSymbol(math, ams, textord, "\\u2127", "\\\\mho");
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2132",
    "\\\\Finv",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2141",
    "\\\\Game",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, textord, "\\u2035", "\\\\backprime");
  defineSymbol(math, ams, textord, "\\u25b2", "\\\\blacktriangle");
  defineSymbol(math, ams, textord, "\\u25bc", "\\\\blacktriangledown");
  defineSymbol(math, ams, textord, "\\u25a0", "\\\\blacksquare");
  defineSymbol(math, ams, textord, "\\u29eb", "\\\\blacklozenge");
  defineSymbol(math, ams, textord, "\\u2605", "\\\\bigstar");
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2222",
    "\\\\sphericalangle",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2201",
    "\\\\complement",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u00f0",
    "\\\\eth",
    createUnicodeEntry: true,
  );
  defineSymbol(text, main, textord, "\\u00f0", "\\u00f0");
  defineSymbol(math, ams, textord, "\\u2571", "\\\\diagup");
  defineSymbol(math, ams, textord, "\\u2572", "\\\\diagdown");
  defineSymbol(math, ams, textord, "\\u25a1", "\\\\square");
  defineSymbol(math, ams, textord, "\\u25a1", "\\\\Box");
  defineSymbol(math, ams, textord, "\\u25ca", "\\\\Diamond");
  defineSymbol(
    math,
    ams,
    textord,
    "\\u00a5",
    "\\\\yen",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    ams,
    textord,
    "\\u00a5",
    "\\\\yen",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2713",
    "\\\\checkmark",
    createUnicodeEntry: true,
  );
  defineSymbol(text, ams, textord, "\\u2713", "\\\\checkmark");
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2136",
    "\\\\beth",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2138",
    "\\\\daleth",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u2137",
    "\\\\gimel",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    textord,
    "\\u03dd",
    "\\\\digamma",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, textord, "\\u03f0", "\\\\varkappa");
  defineSymbol(
    math,
    ams,
    open,
    "\\u250c",
    "\\\\@ulcorner",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    close,
    "\\u2510",
    "\\\\@urcorner",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    open,
    "\\u2514",
    "\\\\@llcorner",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    close,
    "\\u2518",
    "\\\\@lrcorner",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u2266", "\\\\leqq", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a7d",
    "\\\\leqslant",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a95",
    "\\\\eqslantless",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2272",
    "\\\\lesssim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a85",
    "\\\\lessapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u224a",
    "\\\\approxeq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, bin, "\\u22d6", "\\\\lessdot");
  defineSymbol(math, ams, rel, "\\u22d8", "\\\\lll", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2276",
    "\\\\lessgtr",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22da",
    "\\\\lesseqgtr",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a8b",
    "\\\\lesseqqgtr",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u2251", "\\\\doteqdot");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2253",
    "\\\\risingdotseq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2252",
    "\\\\fallingdotseq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u223d",
    "\\\\backsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22cd",
    "\\\\backsimeq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ac5",
    "\\\\subseteqq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22d0",
    "\\\\Subset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u228f",
    "\\\\sqsubset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u227c",
    "\\\\preccurlyeq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22de",
    "\\\\curlyeqprec",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u227e",
    "\\\\precsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ab7",
    "\\\\precapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u22b2", "\\\\vartriangleleft");
  defineSymbol(math, ams, rel, "\\u22b4", "\\\\trianglelefteq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22a8",
    "\\\\vDash",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22aa",
    "\\\\Vvdash",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u2323", "\\\\smallsmile");
  defineSymbol(math, ams, rel, "\\u2322", "\\\\smallfrown");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u224f",
    "\\\\bumpeq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u224e",
    "\\\\Bumpeq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u2267", "\\\\geqq", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a7e",
    "\\\\geqslant",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a96",
    "\\\\eqslantgtr",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2273",
    "\\\\gtrsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a86",
    "\\\\gtrapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, bin, "\\u22d7", "\\\\gtrdot");
  defineSymbol(math, ams, rel, "\\u22d9", "\\\\ggg", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2277",
    "\\\\gtrless",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22db",
    "\\\\gtreqless",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2a8c",
    "\\\\gtreqqless",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2256",
    "\\\\eqcirc",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2257",
    "\\\\circeq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u225c",
    "\\\\triangleq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u223c", "\\\\thicksim");
  defineSymbol(math, ams, rel, "\\u2248", "\\\\thickapprox");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ac6",
    "\\\\supseteqq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22d1",
    "\\\\Supset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2290",
    "\\\\sqsupset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u227d",
    "\\\\succcurlyeq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22df",
    "\\\\curlyeqsucc",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u227f",
    "\\\\succsim",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2ab8",
    "\\\\succapprox",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u22b3", "\\\\vartriangleright");
  defineSymbol(math, ams, rel, "\\u22b5", "\\\\trianglerighteq");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22a9",
    "\\\\Vdash",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u2223", "\\\\shortmid");
  defineSymbol(math, ams, rel, "\\u2225", "\\\\shortparallel");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u226c",
    "\\\\between",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22d4",
    "\\\\pitchfork",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u221d", "\\\\varpropto");
  defineSymbol(math, ams, rel, "\\u25c0", "\\\\blacktriangleleft");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2234",
    "\\\\therefore",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u220d", "\\\\backepsilon");
  defineSymbol(math, ams, rel, "\\u25b6", "\\\\blacktriangleright");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2235",
    "\\\\because",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u22d8", "\\\\llless");
  defineSymbol(math, ams, rel, "\\u22d9", "\\\\gggtr");
  defineSymbol(math, ams, bin, "\\u22b2", "\\\\lhd");
  defineSymbol(math, ams, bin, "\\u22b3", "\\\\rhd");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2242",
    "\\\\eqsim",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u22c8", "\\\\Join");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2251",
    "\\\\Doteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u2214",
    "\\\\dotplus",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, bin, "\\u2216", "\\\\smallsetminus");
  defineSymbol(math, ams, bin, "\\u22d2", "\\\\Cap", createUnicodeEntry: true);
  defineSymbol(math, ams, bin, "\\u22d3", "\\\\Cup", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    bin,
    "\\u2a5e",
    "\\\\doublebarwedge",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u229f",
    "\\\\boxminus",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u229e",
    "\\\\boxplus",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22c7",
    "\\\\divideontimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22c9",
    "\\\\ltimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22ca",
    "\\\\rtimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22cb",
    "\\\\leftthreetimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22cc",
    "\\\\rightthreetimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22cf",
    "\\\\curlywedge",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22ce",
    "\\\\curlyvee",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u229d",
    "\\\\circleddash",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u229b",
    "\\\\circledast",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, bin, "\\u22c5", "\\\\centerdot");
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22ba",
    "\\\\intercal",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, bin, "\\u22d2", "\\\\doublecap");
  defineSymbol(math, ams, bin, "\\u22d3", "\\\\doublecup");
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22a0",
    "\\\\boxtimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21e2",
    "\\\\dashrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21e0",
    "\\\\dashleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c7",
    "\\\\leftleftarrows",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c6",
    "\\\\leftrightarrows",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21da",
    "\\\\Lleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u219e",
    "\\\\twoheadleftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21a2",
    "\\\\leftarrowtail",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ab",
    "\\\\looparrowleft",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21cb",
    "\\\\leftrightharpoons",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21b6",
    "\\\\curvearrowleft",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ba",
    "\\\\circlearrowleft",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u21b0", "\\\\Lsh", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c8",
    "\\\\upuparrows",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21bf",
    "\\\\upharpoonleft",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c3",
    "\\\\downharpoonleft",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u22b8",
    "\\\\multimap",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ad",
    "\\\\leftrightsquigarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c9",
    "\\\\rightrightarrows",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c4",
    "\\\\rightleftarrows",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21a0",
    "\\\\twoheadrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21a3",
    "\\\\rightarrowtail",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ac",
    "\\\\looparrowright",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21b7",
    "\\\\curvearrowright",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21bb",
    "\\\\circlearrowright",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u21b1", "\\\\Rsh", createUnicodeEntry: true);
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21ca",
    "\\\\downdownarrows",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21be",
    "\\\\upharpoonright",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21c2",
    "\\\\downharpoonright",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21dd",
    "\\\\rightsquigarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u21dd", "\\\\leadsto");
  defineSymbol(
    math,
    ams,
    rel,
    "\\u21db",
    "\\\\Rrightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, rel, "\\u21be", "\\\\restriction");
  defineSymbol(math, main, textord, "\\u2018", "`");
  defineSymbol(math, main, textord, "\\\$", "\\\\\\\$");
  defineSymbol(text, main, textord, "\\\$", "\\\\\\\$");
  defineSymbol(text, main, textord, "\\\$", "\\\\textdollar");
  defineSymbol(math, main, textord, "%", "\\\\%");
  defineSymbol(text, main, textord, "%", "\\\\%");
  defineSymbol(math, main, textord, "_", "\\\\_");
  defineSymbol(text, main, textord, "_", "\\\\_");
  defineSymbol(text, main, textord, "_", "\\\\textunderscore");
  defineSymbol(
    math,
    main,
    textord,
    "\\u2220",
    "\\\\angle",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u221e",
    "\\\\infty",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, textord, "\\u2032", "\\\\prime");
  defineSymbol(math, main, textord, "\\u25b3", "\\\\triangle");
  defineSymbol(
    math,
    main,
    textord,
    "\\u0393",
    "\\\\Gamma",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u0394",
    "\\\\Delta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u0398",
    "\\\\Theta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u039b",
    "\\\\Lambda",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u039e",
    "\\\\Xi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u03a0",
    "\\\\Pi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u03a3",
    "\\\\Sigma",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u03a5",
    "\\\\Upsilon",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u03a6",
    "\\\\Phi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u03a8",
    "\\\\Psi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u03a9",
    "\\\\Omega",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, textord, "A", "\\u0391");
  defineSymbol(math, main, textord, "B", "\\u0392");
  defineSymbol(math, main, textord, "E", "\\u0395");
  defineSymbol(math, main, textord, "Z", "\\u0396");
  defineSymbol(math, main, textord, "H", "\\u0397");
  defineSymbol(math, main, textord, "I", "\\u0399");
  defineSymbol(math, main, textord, "K", "\\u039A");
  defineSymbol(math, main, textord, "M", "\\u039C");
  defineSymbol(math, main, textord, "N", "\\u039D");
  defineSymbol(math, main, textord, "O", "\\u039F");
  defineSymbol(math, main, textord, "P", "\\u03A1");
  defineSymbol(math, main, textord, "T", "\\u03A4");
  defineSymbol(math, main, textord, "X", "\\u03A7");
  defineSymbol(
    math,
    main,
    textord,
    "\\u00ac",
    "\\\\neg",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, textord, "\\u00ac", "\\\\lnot");
  defineSymbol(math, main, textord, "\\u22a4", "\\\\top");
  defineSymbol(math, main, textord, "\\u22a5", "\\\\bot");
  defineSymbol(math, main, textord, "\\u2205", "\\\\emptyset");
  defineSymbol(math, ams, textord, "\\u2205", "\\\\varnothing");
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b1",
    "\\\\alpha",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b2",
    "\\\\beta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b3",
    "\\\\gamma",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b4",
    "\\\\delta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03f5",
    "\\\\epsilon",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b6",
    "\\\\zeta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b7",
    "\\\\eta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b8",
    "\\\\theta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b9",
    "\\\\iota",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03ba",
    "\\\\kappa",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03bb",
    "\\\\lambda",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03bc",
    "\\\\mu",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03bd",
    "\\\\nu",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03be",
    "\\\\xi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03bf",
    "\\\\omicron",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c0",
    "\\\\pi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c1",
    "\\\\rho",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c3",
    "\\\\sigma",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c4",
    "\\\\tau",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c5",
    "\\\\upsilon",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03d5",
    "\\\\phi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c7",
    "\\\\chi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c8",
    "\\\\psi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c9",
    "\\\\omega",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03b5",
    "\\\\varepsilon",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03d1",
    "\\\\vartheta",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03d6",
    "\\\\varpi",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03f1",
    "\\\\varrho",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c2",
    "\\\\varsigma",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u03c6",
    "\\\\varphi",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u2217", "*");
  defineSymbol(math, main, bin, "+", "+");
  defineSymbol(math, main, bin, "\\u2212", "-");
  defineSymbol(
    math,
    main,
    bin,
    "\\u22c5",
    "\\\\cdot",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u2218", "\\\\circ");
  defineSymbol(math, main, bin, "\\u00f7", "\\\\div", createUnicodeEntry: true);
  defineSymbol(math, main, bin, "\\u00b1", "\\\\pm", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    bin,
    "\\u00d7",
    "\\\\times",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u2229", "\\\\cap", createUnicodeEntry: true);
  defineSymbol(math, main, bin, "\\u222a", "\\\\cup", createUnicodeEntry: true);
  defineSymbol(math, main, bin, "\\u2216", "\\\\setminus");
  defineSymbol(math, main, bin, "\\u2227", "\\\\land");
  defineSymbol(math, main, bin, "\\u2228", "\\\\lor");
  defineSymbol(
    math,
    main,
    bin,
    "\\u2227",
    "\\\\wedge",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u2228", "\\\\vee", createUnicodeEntry: true);
  defineSymbol(math, main, textord, "\\u221a", "\\\\surd");
  defineSymbol(
    math,
    main,
    open,
    "\\u27e8",
    "\\\\langle",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, open, "\\u2223", "\\\\lvert");
  defineSymbol(math, main, open, "\\u2225", "\\\\lVert");
  defineSymbol(math, main, close, "?", "?");
  defineSymbol(math, main, close, "!", "!");
  defineSymbol(
    math,
    main,
    close,
    "\\u27e9",
    "\\\\rangle",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, close, "\\u2223", "\\\\rvert");
  defineSymbol(math, main, close, "\\u2225", "\\\\rVert");
  defineSymbol(math, main, rel, "=", "=");
  defineSymbol(math, main, rel, ":", ":");
  defineSymbol(
    math,
    main,
    rel,
    "\\u2248",
    "\\\\approx",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2245",
    "\\\\cong",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u2265", "\\\\ge");
  defineSymbol(math, main, rel, "\\u2265", "\\\\geq", createUnicodeEntry: true);
  defineSymbol(math, main, rel, "\\u2190", "\\\\gets");
  defineSymbol(math, main, rel, ">", "\\\\gt", createUnicodeEntry: true);
  defineSymbol(math, main, rel, "\\u2208", "\\\\in", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    rel,
    "\\u2209",
    "\\\\notin",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\ue020", "\\\\@not");
  defineSymbol(
    math,
    main,
    rel,
    "\\u2282",
    "\\\\subset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2283",
    "\\\\supset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2284",
    "\\\\nsubset",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2286",
    "\\\\subseteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2287",
    "\\\\supseteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2288",
    "\\\\nsubseteq",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    rel,
    "\\u2289",
    "\\\\nsupseteq",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u22a8", "\\\\models");
  defineSymbol(
    math,
    main,
    rel,
    "\\u2190",
    "\\\\leftarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u2264", "\\\\le");
  defineSymbol(math, main, rel, "\\u2264", "\\\\leq", createUnicodeEntry: true);
  defineSymbol(math, main, rel, "<", "\\\\lt", createUnicodeEntry: true);
  defineSymbol(
    math,
    main,
    rel,
    "\\u2192",
    "\\\\rightarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, rel, "\\u2192", "\\\\to");
  defineSymbol(math, ams, rel, "\\u2271", "\\\\ngeq", createUnicodeEntry: true);
  defineSymbol(math, ams, rel, "\\u2270", "\\\\nleq", createUnicodeEntry: true);
  defineSymbol(math, main, spacing, "\\u00a0", "\\\\ ");
  defineSymbol(math, main, spacing, "\\u00a0", "~");
  defineSymbol(math, main, spacing, "\\u00a0", "\\\\space");
  defineSymbol(math, main, spacing, "\\u00a0", "\\\\nobreakspace");
  defineSymbol(text, main, spacing, "\\u00a0", "\\\\ ");
  defineSymbol(text, main, spacing, "\\u00a0", " ");
  defineSymbol(text, main, spacing, "\\u00a0", "~");
  defineSymbol(text, main, spacing, "\\u00a0", "\\\\space");
  defineSymbol(text, main, spacing, "\\u00a0", "\\\\nobreakspace");
  defineSymbol(math, main, spacing, null, "\\\\nobreak");
  defineSymbol(math, main, spacing, null, "\\\\allowbreak");
  defineSymbol(math, main, punct, ",", ",");
  defineSymbol(math, main, punct, ";", ";");
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22bc",
    "\\\\barwedge",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22bb",
    "\\\\veebar",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    bin,
    "\\u2299",
    "\\\\odot",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    bin,
    "\\u2295",
    "\\\\oplus",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    bin,
    "\\u2297",
    "\\\\otimes",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u2202",
    "\\\\partial",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    bin,
    "\\u2298",
    "\\\\oslash",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u229a",
    "\\\\circledcirc",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    ams,
    bin,
    "\\u22a1",
    "\\\\boxdot",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, bin, "\\u25b3", "\\\\bigtriangleup");
  defineSymbol(math, main, bin, "\\u25bd", "\\\\bigtriangledown");
  defineSymbol(math, main, bin, "\\u2020", "\\\\dagger");
  defineSymbol(math, main, bin, "\\u22c4", "\\\\diamond");
  defineSymbol(math, main, bin, "\\u22c6", "\\\\star");
  defineSymbol(math, main, bin, "\\u25c3", "\\\\triangleleft");
  defineSymbol(math, main, bin, "\\u25b9", "\\\\triangleright");
  defineSymbol(math, main, open, "{", "\\\\{");
  defineSymbol(text, main, textord, "{", "\\\\{");
  defineSymbol(text, main, textord, "{", "\\\\textbraceleft");
  defineSymbol(math, main, close, "}", "\\\\}");
  defineSymbol(text, main, textord, "}", "\\\\}");
  defineSymbol(text, main, textord, "}", "\\\\textbraceright");
  defineSymbol(math, main, open, "{", "\\\\lbrace");
  defineSymbol(math, main, close, "}", "\\\\rbrace");
  defineSymbol(math, main, open, "[", "\\\\lbrack", createUnicodeEntry: true);
  defineSymbol(
    text,
    main,
    textord,
    "[",
    "\\\\lbrack",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, close, "]", "\\\\rbrack", createUnicodeEntry: true);
  defineSymbol(
    text,
    main,
    textord,
    "]",
    "\\\\rbrack",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, open, "(", "\\\\lparen", createUnicodeEntry: true);
  defineSymbol(math, main, close, ")", "\\\\rparen", createUnicodeEntry: true);
  defineSymbol(
    text,
    main,
    textord,
    "<",
    "\\\\textless",
    createUnicodeEntry: true,
  ); // in T1 fontenc
  defineSymbol(
    text,
    main,
    textord,
    ">",
    "\\\\textgreater",
    createUnicodeEntry: true,
  ); // in T1 fontenc
  defineSymbol(
    math,
    main,
    open,
    "\\u230a",
    "\\\\lfloor",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    close,
    "\\u230b",
    "\\\\rfloor",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    open,
    "\\u2308",
    "\\\\lceil",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    close,
    "\\u2309",
    "\\\\rceil",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, textord, "\\\\", "\\\\backslash");
  defineSymbol(math, main, textord, "\\u2223", "|");
  defineSymbol(math, main, textord, "\\u2223", "\\\\vert");
  defineSymbol(
    text,
    main,
    textord,
    "|",
    "\\\\textbar",
    createUnicodeEntry: true,
  ); // in T1 fontenc
  defineSymbol(math, main, textord, "\\u2225", "\\\\|");
  defineSymbol(math, main, textord, "\\u2225", "\\\\Vert");
  defineSymbol(text, main, textord, "\\u2225", "\\\\textbardbl");
  defineSymbol(text, main, textord, "~", "\\\\textasciitilde");
  defineSymbol(text, main, textord, "\\\\", "\\\\textbackslash");
  defineSymbol(text, main, textord, "^", "\\\\textasciicircum");
  defineSymbol(
    math,
    main,
    rel,
    "\\u2191",
    "\\\\uparrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21d1",
    "\\\\Uparrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2193",
    "\\\\downarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21d3",
    "\\\\Downarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u2195",
    "\\\\updownarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    rel,
    "\\u21d5",
    "\\\\Updownarrow",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, op, "\\u2210", "\\\\coprod");
  defineSymbol(math, main, op, "\\u22c1", "\\\\bigvee");
  defineSymbol(math, main, op, "\\u22c0", "\\\\bigwedge");
  defineSymbol(math, main, op, "\\u2a04", "\\\\biguplus");
  defineSymbol(math, main, op, "\\u22c2", "\\\\bigcap");
  defineSymbol(math, main, op, "\\u22c3", "\\\\bigcup");
  defineSymbol(math, main, op, "\\u222b", "\\\\int");
  defineSymbol(math, main, op, "\\u222b", "\\\\intop");
  defineSymbol(math, main, op, "\\u222c", "\\\\iint");
  defineSymbol(math, main, op, "\\u222d", "\\\\iiint");
  defineSymbol(math, main, op, "\\u220f", "\\\\prod");
  defineSymbol(math, main, op, "\\u2211", "\\\\sum");
  defineSymbol(math, main, op, "\\u2a02", "\\\\bigotimes");
  defineSymbol(math, main, op, "\\u2a01", "\\\\bigoplus");
  defineSymbol(math, main, op, "\\u2a00", "\\\\bigodot");
  defineSymbol(math, main, op, "\\u222e", "\\\\oint");
  defineSymbol(math, main, op, "\\u2a06", "\\\\bigsqcup");
  defineSymbol(math, main, op, "\\u222b", "\\\\smallint");
  defineSymbol(text, main, inner, "\\u2026", "\\\\textellipsis");
  defineSymbol(math, main, inner, "\\u2026", "\\\\mathellipsis");
  defineSymbol(
    text,
    main,
    inner,
    "\\u2026",
    "\\\\ldots",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    inner,
    "\\u2026",
    "\\\\ldots",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    inner,
    "\\u22ef",
    "\\\\@cdots",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    inner,
    "\\u22f1",
    "\\\\ddots",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    textord,
    "\\u22ee",
    "\\\\varvdots",
  ); // \\vdots is a macro
  defineSymbol(math, main, accent, "\\u02ca", "\\\\acute");
  defineSymbol(math, main, accent, "\\u02cb", "\\\\grave");
  defineSymbol(math, main, accent, "\\u00a8", "\\\\ddot");
  defineSymbol(math, main, accent, "\\u007e", "\\\\tilde");
  defineSymbol(math, main, accent, "\\u02c9", "\\\\bar");
  defineSymbol(math, main, accent, "\\u02d8", "\\\\breve");
  defineSymbol(math, main, accent, "\\u02c7", "\\\\check");
  defineSymbol(math, main, accent, "\\u005e", "\\\\hat");
  defineSymbol(math, main, accent, "\\u20d7", "\\\\vec");
  defineSymbol(math, main, accent, "\\u02d9", "\\\\dot");
  defineSymbol(math, main, accent, "\\u02da", "\\\\mathring");
  defineSymbol(
    math,
    main,
    mathord,
    "\\u0131",
    "\\\\imath",
    createUnicodeEntry: true,
  );
  defineSymbol(
    math,
    main,
    mathord,
    "\\u0237",
    "\\\\jmath",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u0131",
    "\\\\i",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u0237",
    "\\\\j",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00df",
    "\\\\ss",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00e6",
    "\\\\ae",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u0153",
    "\\\\oe",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00f8",
    "\\\\o",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00c6",
    "\\\\AE",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u0152",
    "\\\\OE",
    createUnicodeEntry: true,
  );
  defineSymbol(
    text,
    main,
    textord,
    "\\u00d8",
    "\\\\O",
    createUnicodeEntry: true,
  );
  defineSymbol(text, main, accent, "\\u02ca", "\\\\'"); // acute
  defineSymbol(text, main, accent, "\\u02cb", "\\\\`"); // grave
  defineSymbol(text, main, accent, "\\u02c6", "\\\\^"); // circumflex
  defineSymbol(text, main, accent, "\\u02dc", "\\\\~"); // tilde
  defineSymbol(text, main, accent, "\\u02c9", "\\\\="); // macron
  defineSymbol(text, main, accent, "\\u02d8", "\\\\u"); // breve
  defineSymbol(text, main, accent, "\\u02d9", "\\\\."); // dot above
  defineSymbol(text, main, accent, "\\u02da", "\\\\r"); // ring above
  defineSymbol(text, main, accent, "\\u02c7", "\\\\v"); // caron
  defineSymbol(text, main, accent, "\\u00a8", '\\\\"'); // diaresis
  defineSymbol(text, main, accent, "\\u02dd", "\\\\H"); // double acute
  defineSymbol(
    text,
    main,
    accent,
    "\\u25ef",
    "\\\\textcircled",
  ); // \\bigcirc glyph
  defineSymbol(text, main, textord, "\\u2013", "--", createUnicodeEntry: true);
  defineSymbol(text, main, textord, "\\u2013", "\\\\textendash");
  defineSymbol(text, main, textord, "\\u2014", "---", createUnicodeEntry: true);
  defineSymbol(text, main, textord, "\\u2014", "\\\\textemdash");
  defineSymbol(text, main, textord, "\\u2018", "`", createUnicodeEntry: true);
  defineSymbol(text, main, textord, "\\u2018", "\\\\textquoteleft");
  defineSymbol(text, main, textord, "\\u2019", "'", createUnicodeEntry: true);
  defineSymbol(text, main, textord, "\\u2019", "\\\\textquoteright");
  defineSymbol(text, main, textord, "\\u201c", "``", createUnicodeEntry: true);
  defineSymbol(text, main, textord, "\\u201c", "\\\\textquotedblleft");
  defineSymbol(text, main, textord, "\\u201d", "''", createUnicodeEntry: true);
  defineSymbol(text, main, textord, "\\u201d", "\\\\textquotedblright");
  defineSymbol(
    math,
    main,
    textord,
    "\\u00b0",
    "\\\\degree",
    createUnicodeEntry: true,
  );
  defineSymbol(text, main, textord, "\\u00b0", "\\\\degree");
  defineSymbol(
    text,
    main,
    textord,
    "\\u00b0",
    "\\\\textdegree",
    createUnicodeEntry: true,
  );
  defineSymbol(math, main, mathord, "\\u00a3", "\\\\pounds");
  defineSymbol(
    math,
    main,
    mathord,
    "\\u00a3",
    "\\\\mathsterling",
    createUnicodeEntry: true,
  );
  defineSymbol(text, main, mathord, "\\u00a3", "\\\\pounds");
  defineSymbol(
    text,
    main,
    mathord,
    "\\u00a3",
    "\\\\textsterling",
    createUnicodeEntry: true,
  );
  defineSymbol(math, ams, textord, "\\u2720", "\\\\maltese");
  defineSymbol(text, ams, textord, "\\u2720", "\\\\maltese");

  lines.addAll([
    '  ${CaTeXMode.text}: {',
    ...textSymbols,
    '  },',
    '  ${CaTeXMode.math}: {',
    ...mathSymbols,
    '  },',
    '};\n',
  ]);

  await file.writeAsString(lines.join('\n'));
}

// ignore_for_file: prefer_single_quotes
