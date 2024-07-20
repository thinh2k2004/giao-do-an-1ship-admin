import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GestureBaseButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onLongTap;

  const GestureBaseButton(
      {required this.child, super.key, this.onTap, this.onLongTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      onLongPressStart: (d) async {
        HapticFeedback.heavyImpact();
      },
      onLongPress: onLongTap,
      child: child,
    );
  }
}
