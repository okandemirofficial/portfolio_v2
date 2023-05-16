import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/widgets/common/apply_desktop_space.dart';
import 'package:portfolio_v2/widgets/common/scroll_controllers.dart';
import 'package:portfolio_v2/widgets/project_items/applantis.dart';
import 'package:portfolio_v2/widgets/project_items/diziyleogren.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/fransiz_gastesi.dart';

const _heightList = <double>[
  6,
];

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplyDesktopSpace(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 4000,
            child: Stack(
              children: [
                VerticalDivider(
                  thickness: 0.5,
                  indent: _heightList[0],
                  width: 16,
                  color: appColorsDark.onBackground,
                ),
                const Positioned(
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _heightList[0] - 6,
                ),
                const Text('Jan 23 - Present'),
                Applantis(
                  scrollController: ManuelScrollingController.horizontalControllers[0],
                ),
                const SizedBox(
                  height: 128,
                ),
                const Text('Jul 22 - Jan 23'),
                FransizGastesi(
                  scrollController: ManuelScrollingController.horizontalControllers[1],
                ),
                const SizedBox(
                  height: 128,
                ),
                const Text('Jun 19 - Present'),
                Diziyleogren(
                  scrollController: ManuelScrollingController.horizontalControllers[2],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
