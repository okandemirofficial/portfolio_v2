import 'package:flutter/material.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';

class ApplyDesktopSpace extends StatelessWidget {
  const ApplyDesktopSpace({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //  final width = constraints.biggest.width;
        return Row(
          children: [
            if (!context.isMobile)
              const Expanded(
                flex: 2,
                child: SizedBox.shrink(),
              ),
            Expanded(
              flex: 6,
              child: child,
            ),
            if (!context.isMobile)
              const Expanded(
                flex: 2,
                child: SizedBox.shrink(),
              ),
          ],
        );
      },
    );
  }
}
