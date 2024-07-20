import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Stream<bool>? loading;
  final AppBar? appBar;
  final Widget? child;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;
  final bool safeAreaLeft;

  final bool safeAreaRight;

  final bool safeAreaTop;

  final bool safeAreaBottom;

  const BaseWidget({
    Key? key,
    this.loading,
    this.appBar,
    this.child,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: SafeArea(
        top: !extendBodyBehindAppBar && safeAreaTop,
        bottom: safeAreaBottom,
        left: safeAreaLeft,
        right: safeAreaRight,
        child: StreamBuilder<bool>(
          stream: loading,
          builder: (context, snapshot) {
            return Stack(
              children: [
                child ?? const SizedBox.shrink(),
                if (snapshot.data ?? false)
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
