import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/widgets/common/apply_desktop_space.dart';
import 'package:portfolio_v2/widgets/common/scroll_controllers.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _heightList[0] - 6,
              ),
              const Text('Jan 23 - Present'),
              ProjectItem(
                scrollController: ManuelScrollingController.horizontalControllers[0],
              ),
              const SizedBox(
                height: 64,
              ),
              ProjectItem(
                scrollController: ManuelScrollingController.horizontalControllers[1],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Placeholder(
              fallbackHeight: 500,
              fallbackWidth: 500,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Placeholder(
              fallbackHeight: 500,
              fallbackWidth: 500,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Placeholder(
              fallbackHeight: 500,
              fallbackWidth: 500,
            ),
          ),
        ],
      ),
    );
  }
}
