import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// dislodge the any subclass of ScrollView's inkwell
/// 去除scroll view的 水印

class OverScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.fuchsia:
      case TargetPlatform.android:
        return GlowingOverscrollIndicator(
          child: child,
          //do not show head's inkwell
          showLeading: false,
          //do not show tail's inkwell
          showTrailing: false,
          axisDirection: AxisDirection.down,
          color: Theme.of(context).accentColor,
        );
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
    }
    return super.buildOverscrollIndicator(context, child, details);
  }
}
