import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/widgets/common/apply_desktop_space.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ApplyDesktopSpace(
      child: _IntroductionColumn(),
    );
  }
}

class _IntroductionColumn extends StatelessWidget {
  const _IntroductionColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 128,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hello! I am ',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextSpan(
                text: 'Okan',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: appColorsDark.primary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              TextSpan(
                text: ' from Istanbul. A Flutter Mobile Developer with over ',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextSpan(
                text: '3',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: appColorsDark.primary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              TextSpan(
                text: ' years of experience.',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
        SizedBox(height: context.isMobile ? 16 : 64),
        Text(
          "Designing, developing, and maintaining high-quality mobile applications for IOS and Android platforms.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: context.isMobile ? 16 : 64),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            children: [
              Text(
                'To see my projects',
                style:
                    Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w100),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 32,
              ),
            ],
          ),
        )
      ],
    );
  }
}
