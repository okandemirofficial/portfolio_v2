import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ManuelScrollingController {
  static final _projectBreakPoints = <double>[700, 1200];

  static final mainController = ScrollController();

  static final horizontalControllers = [
    ScrollController(),
    ScrollController(),
  ];

  static int _index = 0;

  static double _mainScroll = 0;
  static const double _mainScrollOffset = 10;
  static const double _horizontalScrollOffset = 50;

  static const int _animationDuration = 250;

  ///https://github.com/mayurnile/web_smooth_scroll/blob/main/lib/src/source.dart
  static void onPointerSignal(PointerSignalEvent event) async {
    if (event is PointerScrollEvent) {
      //First calculate target scroll of main scroll controller
      final double mainTarget =
          _calculateTargetScroll(event, mainController, _mainScroll, _mainScrollOffset);

      final index = _index;

      ///If _index passed list count: let it go
      if (index >= _projectBreakPoints.length) {
        _animateTargetController(mainController, mainTarget);
        _mainScroll = mainTarget;
        return;
      }

      //If target smaller than current breakPoint. animate and return
      if (mainTarget <= _projectBreakPoints[index]) {
        _animateTargetController(mainController, mainTarget);
        _mainScroll = mainTarget;
        return;
      }

      //If main target scrool exceeds currentBreakPoint:

      // 1- Animate mainScroll until breakpoint
      _animateTargetController(mainController, _projectBreakPoints[index]);
      _mainScroll = _projectBreakPoints[index];

      // 2- Check current vertical controller status and animate.
      final double horizontalTarget = _calculateTargetScroll(event, horizontalControllers[index],
          horizontalControllers[index].offset, _horizontalScrollOffset);

      // 3- Animate horizontalTarget
      await _animateTargetController(horizontalControllers[index], horizontalTarget);

      // 4- Check horizontalController and increaseIndex if it's exceed edges
      if (horizontalControllers[index].offset >=
          horizontalControllers[index].position.maxScrollExtent) {
        _index = _index + 1;
        return;
      }
      debugPrint('offset: ${horizontalControllers[_index].offset}');
      debugPrint('minScrollExtent: ${horizontalControllers[_index].position.minScrollExtent}');
      if (horizontalControllers[index].offset <=
          horizontalControllers[index].position.minScrollExtent) {
        _index = _index - 1;
        return;
      }
    }
  }

  ///It's mobile version of [onPointerSignal]
  static void onVerticalDragUpdate(DragUpdateDetails details) async {
    debugPrint(details.delta.dy.toString());

    //First calculate target scroll of main scroll controller
    final double mainTarget =
        _calculateTargetMove(details, mainController, _mainScroll, _mainScrollOffset);

    final index = _index;

    ///If _index passed list count: let it go
    if (index >= _projectBreakPoints.length) {
      _jumpTargetController(mainController, mainTarget);
      _mainScroll = mainTarget;
      return;
    }

    //If target smaller than current breakPoint. animate and return
    if (mainTarget <= _projectBreakPoints[index]) {
      _jumpTargetController(mainController, mainTarget);
      _mainScroll = mainTarget;
      return;
    }

    //If main target scrool exceeds currentBreakPoint:

    // 1- Animate mainScroll until breakpoint
    _jumpTargetController(mainController, _projectBreakPoints[index]);
    _mainScroll = _projectBreakPoints[index];

    // 2- Check current vertical controller status and animate.
    final double horizontalTarget = _calculateTargetMove(details, horizontalControllers[index],
        horizontalControllers[index].offset, _horizontalScrollOffset);

    // 3- Animate horizontalTarget
    _jumpTargetController(horizontalControllers[index], horizontalTarget);

    // 4- Check horizontalController and increaseIndex if it's exceed edges
    if (horizontalControllers[index].offset >=
        horizontalControllers[index].position.maxScrollExtent) {
      _index = _index + 1;
      return;
    }
    debugPrint('offset: ${horizontalControllers[_index].offset}');
    debugPrint('minScrollExtent: ${horizontalControllers[_index].position.minScrollExtent}');
    if (horizontalControllers[index].offset <=
        horizontalControllers[index].position.minScrollExtent) {
      _index = _index - 1;
      return;
    }
  }

  static double _calculateTargetScroll(PointerScrollEvent event, ScrollController controller,
      double targetScroll, double scrollOfset) {
    // Checking if scroll happened is up or down
    if (event.scrollDelta.dy > 0) {
      // Adding the extra offset to over scroll done by user
      targetScroll += (event.scrollDelta.dy + scrollOfset);
    } else {
      // Adding the extra offset to over scroll done by user
      // here we are subtracting the widget scroll offset because
      // [event.scrollDelta.dy] value is negative so to
      // increase overall offset we are subtracting because
      // negative - negative values get added
      targetScroll += (event.scrollDelta.dy - scrollOfset);
    }

    // Checking if scroll has reached to bottom of the screen
    if (targetScroll > controller.position.maxScrollExtent) {
      targetScroll = controller.position.maxScrollExtent;
    }

    // Checking if scroll has gone before the starting point
    // so resetting it back to 0
    if (targetScroll < 0) {
      targetScroll = 0;
    }
    return targetScroll;
  }

  ///Its mobile version of [_calculateTargetScroll]
  static double _calculateTargetMove(DragUpdateDetails details, ScrollController controller,
      double targetScroll, double scrollOfset) {
    targetScroll += (details.delta.dy * -1.2);

    // Checking if scroll has reached to bottom of the screen
    if (targetScroll > controller.position.maxScrollExtent) {
      targetScroll = controller.position.maxScrollExtent;
    }

    // Checking if scroll has gone before the starting point
    // so resetting it back to 0
    if (targetScroll < 0) {
      targetScroll = 0;
    }
    return targetScroll;
  }

  static Future<void> _animateTargetController(
      ScrollController controller, double targetScroll) async {
    await controller.animateTo(
      targetScroll,
      duration: const Duration(milliseconds: _animationDuration),
      curve: Curves.easeInOut,
    );
  }

  ///Mobile version of [_animateTargetController]
  static void _jumpTargetController(ScrollController controller, double targetScroll) async {
    controller.jumpTo(targetScroll);
  }
}

// static void onPointerSignal(PointerSignalEvent event) {
//   int selectedMs = _animationDuration;

//   if (event is PointerScrollEvent) {
//     // Checking if scroll happened is up or down
//     if (event.scrollDelta.dy > 0) {
//       // Adding the extra offset to over scroll done by user
//       _currentScroll += (event.scrollDelta.dy + _defaultScrollOffset);
//     } else {
//       // Adding the extra offset to over scroll done by user
//       // here we are subtracting the widget scroll offset because
//       // [event.scrollDelta.dy] value is negative so to
//       // increase overall offset we are subtracting because
//       // negative - negative values get added
//       _currentScroll += (event.scrollDelta.dy - _defaultScrollOffset);
//     }

//     // Checking if scroll has reached to bottom of the screen
//     if (_currentScroll > mainController.position.maxScrollExtent) {
//       _currentScroll = mainController.position.maxScrollExtent;
//       selectedMs = _animationDuration ~/ 4;
//     }

//     // Checking if scroll has gone before the starting point
//     // so resetting it back to 0
//     if (_currentScroll < 0) {
//       _currentScroll = 0;
//       selectedMs = _animationDuration ~/ 4;
//     }

//     mainController.animateTo(
//       _currentScroll,
//       duration: Duration(milliseconds: selectedMs),
//       curve: Curves.easeInOut,
//     );
//   }
// }
