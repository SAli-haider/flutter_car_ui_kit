import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_ui_kit/constants.dart';



class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.press,
    required this.isLock,
    required this.lockKey, required this.unlockKey,
  }) : super(key: key);

  final VoidCallback press;
  final bool isLock;
  final ValueKey<String> lockKey;
  final ValueKey<String> unlockKey;

  @override
  Widget build(BuildContext context) {
    print(isLock);
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: isLock
            ? SvgPicture.asset(
          "assets/icons/door_lock.svg",
          key: lockKey,
        )
            : SvgPicture.asset(
          "assets/icons/door_unlock.svg",
          key: unlockKey,
        ),
      ),
    );
  }
}