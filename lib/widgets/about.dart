import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio_v2/const/const.dart';
import 'package:portfolio_v2/const/project_paddings.dart';
import 'package:portfolio_v2/extension/responsive_sizer_extension.dart';
import 'package:portfolio_v2/utils/paddings.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: Const.defaultShape,
      child: Padding(
        padding: EdgeInsets.all(context.isMobile ? ProjectPaddings.xlarge : ProjectPaddings.medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Okan',
                  style: context.isMobile
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.headlineLarge,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Mobile Application',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Developer',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
            ClipOval(
              child: Image.asset(
                'images/pp.jpg',
                height: context.isMobile ? 200 : 200,
                width: context.isMobile ? 200 : 200,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'me@okandemir.net',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Istanbul / Turkey',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 48,
            ),
            RowWithSpacing.m(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(
                      LineIcons.github,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                PaddingHorizontal.s(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      child: Icon(
                        LineIcons.mediumM,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(
                      LineIcons.linkedinIn,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                  ),
                ),
                PaddingHorizontal.s(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      child: Icon(
                        LineIcons.instagram,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mail_outline_rounded,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'MAIL ME!',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}
