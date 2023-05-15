import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/widgets/about.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: widget!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: '/',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(32.0),
        children: const [
          ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: AboutWidget(),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 5,
                child: AboutWidget(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
