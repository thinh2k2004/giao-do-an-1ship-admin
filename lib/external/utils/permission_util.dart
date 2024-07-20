import 'dart:io';

import 'package:base_getx/external/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static final PermissionUtil _instance = PermissionUtil._();

  factory PermissionUtil() {
    return _instance;
  }

  PermissionUtil._();

  Future<bool> requestPhotoPermission(BuildContext context) async {
    if (!Platform.isIOS) {
      return true;
    }
    PermissionStatus status = await Permission.photos.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      // ignore: use_build_context_synchronously
      showCustomCupertinoDialog(
        context: context,
        title: 'Cho phép ứng dụng truy cập ảnh',
        content:
            'Đi đến cài đặt rồi nhấn vào "Ảnh", và chọn "Tất cả ảnh" để tải ảnh lên',
        titleConfirm: 'Mở cài đặt',
        onConfirm: () {
          openAppSettings();
        },
      );
      return false;
    }

    status = await Permission.photos.request();

    if (status.isGranted || status.isLimited) {
      return true;
    }

    return false;
  }

  Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    } else {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        return true;
      } else {
        // ignore: use_build_context_synchronously
        showCustomCupertinoDialog(
          context: context,
          title: 'Truy cập Camera bị từ chối',
          content: 'Vui lòng vào phần cài đặt và cho phép truy cập Camera',
          titleConfirm: 'Mở cài đặt',
          onConfirm: () {
            openAppSettings();
          },
        );
        return false;
      }
    }
  }

  Future<bool> requestTrackingTransparencyPermission() async {
    if (!Platform.isIOS) {
      return true;
    }

    PermissionStatus status = await Permission.appTrackingTransparency.status;

    if (status.isGranted) {
      return true;
    }

    status = await Permission.appTrackingTransparency.request();

    return status.isGranted;
  }

  Future<bool> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;

    if (status.isGranted) {
      return true;
    }

    status = await Permission.notification.request();

    return status.isGranted;
  }
}
