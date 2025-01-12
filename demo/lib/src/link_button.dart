import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Stylized button widget for linking to outside resources.
class LinkButton extends StatelessWidget {
  /// Constructs a [LinkButton] from a [label], a [url], and an optional
  /// [child].
  const LinkButton({
    super.key,
    required this.label,
    required this.url,
    this.child,
  });

  /// Label for the button.
  final String label;

  /// URL to link to, i.e. to open.
  final String url;

  /// Icon for this button.
  ///
  /// Can be left null.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    void onPressed() => launchUrl(Uri.parse(url));

    Widget result = Text(
      label,
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    if (child == null) {
      result = TextButton(
        onPressed: onPressed,
        child: result,
      );
    } else {
      result = TextButton.icon(
        onPressed: onPressed,
        label: result,
        icon: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 32,
          ),
          child: child,
        ),
      );
    }

    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(),
        ),
      ),
      child: result,
    );
  }
}
