import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void dismissKeyboard() {
  // FocusScopeNode currentFocus = FocusScope.of(context);
  // if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
  //   FocusManager.instance.primaryFocus?.unfocus();
  // }
  Get.focusScope?.unfocus();
}

void showToast(
  String msg, {
  Toast toastLength = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

void showCustomCupertinoDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
  String titleConfirm = 'Đồng ý',
  String titleCancel = 'Huỷ',
  bool isDestructiveAction = false,
}) {
  showDialog(
    context: context,
    builder: (c) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(titleCancel),
          onPressed: () {
            Get.back();
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          isDestructiveAction: isDestructiveAction,
          child: Text(titleConfirm),
          onPressed: () {
            Get.back();
            onConfirm();
          },
        ),
      ],
    ),
  );
}

Future<void> appLogOut() async {
  await Get.find<IAuthenticationRepository>().clearSecureStorage();
  await Get.find<IAuthenticationRepository>().clearSharedPreferences();
  // Get.offAllNamed(Routes.WELCOME);
}
