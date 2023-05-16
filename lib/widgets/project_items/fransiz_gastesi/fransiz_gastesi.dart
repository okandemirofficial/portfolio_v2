import 'package:flutter/material.dart';
import 'package:portfolio_v2/widgets/common/store_badge.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/app_preview/homepage.dart';

class FransizGastesi extends StatelessWidget {
  const FransizGastesi({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    //return Text('anan');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Fransız Gastesi',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                  '• Fransız Gastesi is a culture & news platform which well-known in Francophonie community.'),
              const Text(
                  '• Developed a one-of-a-kind news and blog application with a unique design.'),
              const Text('• WordPress API as a back-end solution.'),
              const Text('• Riverpod State Management. Isar storage'),
              const Text('• Firebase Notifications & Analytics'),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                    height: 60,
                    child: StoreBadge(
                        isIos: false,
                        link:
                            'https://play.google.com/store/apps/details?id=com.applantis.serve24pro'),
                  ),
                  SizedBox(width: 32),
                  SizedBox(
                    height: 60,
                    child:
                        StoreBadge(isIos: true, link: 'https://apps.apple.com/tr/app/id1661857071'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 600,
            child: FransizGastesiHomepage(scrollController),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
