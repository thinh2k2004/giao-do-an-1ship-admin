import 'package:base_getx/external/constants/app_styles.dart';
import 'package:base_getx/domain/utils/app_log.dart';
import 'package:base_getx/external/generated/assets.gen.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../base/base_widget.dart';
import '../../../presenters/controllers/debug/debug_controller.dart';

class DebugPage extends GetWidget<DebugController> {
  const DebugPage({super.key});

  Color _resolveColor(LogType type) {
    if (type.isError) {
      return Colors.red;
    } else if (type.isWarning) {
      return Colors.amber;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        title: const Text('Debug Info'),
        actions: [
          IconButton(
            onPressed: () {
              AppLog.clearLog();
            },
            icon: const Icon(Icons.delete_forever),
          ),
          IconButton(
            onPressed: () {
              ChuckerFlutter.showChuckerScreen();
            },
            icon: SvgPicture.asset(
              Assets.icons.icDebugTrace.path,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      safeAreaBottom: false,
      child: Scrollbar(
        child: Obx(
          () => ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final commonLog = AppLog.listLog[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: AppStyles.text16W700.copyWith(color: Colors.blue),
                      children: [
                        TextSpan(
                            text:
                                'CONSOLE LOG #${AppLog.listLog.length - index}'),
                        TextSpan(
                          text: ' - ${commonLog.time}',
                          style: AppStyles.text14W400
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    commonLog.message,
                    style: AppStyles.text14W500.copyWith(
                      color: _resolveColor(commonLog.type),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemCount: AppLog.listLog.length,
          ),
        ),
      ),
    );
  }
}
