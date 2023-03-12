import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? body;
  final Widget? endDrawer;

  const AppScaffold({
    this.appBar,
    this.body,
    this.endDrawer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return Scaffold(
        appBar: appBar,
        body: Row(
          children: [
            Expanded(child: body ?? const SizedBox()),
            if (endDrawer != null) endDrawer!,
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      endDrawer: endDrawer,
      body: body,
    );
  }
}
