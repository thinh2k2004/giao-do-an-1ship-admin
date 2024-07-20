import 'package:base_getx/external/constants/app_colors.dart';
import 'package:base_getx/external/constants/app_styles.dart';
import 'package:base_getx/external/routes/app_pages.dart';
import 'package:float_bubble/float_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingDebugButton extends StatelessWidget {
  final bool shouldShowDebugButton;

  const FloatingDebugButton({
    Key? key,
    this.shouldShowDebugButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatBubble(
      show: shouldShowDebugButton,
      initialAlignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.DEBUG);
        },
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ]),
            child: FittedBox(
              child: Text(
                'Debug',
                style:
                    AppStyles.text16W700.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
