import 'package:base_getx/domain/constants/flavor.dart';
import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/external/base/base_widget.dart';
import 'package:base_getx/external/constants/app_styles.dart';
import 'package:base_getx/external/custom_view/image_network.dart';
import 'package:base_getx/external/utils/app_utils.dart';
import 'package:base_getx/external/utils/local_languages.dart';
import 'package:base_getx/presenters/controllers/home/home_controller.dart';
import 'package:base_getx/presenters/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      loading: controller.loadingStatus,
      appBar: AppBar(
        title: Text(Flavor.flavorType.value),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Obx(
              () => ImageNetwork(imageUrl: controller.photo.value.thumbnailUrl),
            ),
            Text(
              LocaleKeys.ok.tr,
              style: AppStyles.text30W600,
            ),
            Obx(
              () => Text(
                controller.todoTask.value.title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Text(LocaleKeys.hello.tr),
            Text(
              LocaleKeys.logged_in.trParams({
                'name': 'Jhon',
                'email': 'jhon@example.com',
              }),
            ),
            ElevatedButton(
              onPressed: () {
                if (Get.locale?.languageCode == 'vi') {
                  LocalLanguages.setLanguage(const Locale('en', 'US'));
                } else {
                  LocalLanguages.setLanguage(const Locale('vi', 'VN'));
                }
              },
              child: const Text('Change language'),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.find<IAuthenticationRepository>()
                    .saveFirebaseToken('token 123');
              },
              child: Text('set'),
            ),
            ElevatedButton(
              onPressed: () async {
                print(Get.find<IAuthenticationRepository>().getLanguageCode());
                print(Get.find<IAuthenticationRepository>().getCountryCode());
                showToast(
                    Get.find<IAuthenticationRepository>().getLanguageCode());
              },
              child: Text('get'),
            ),
          ],
        ),
      ),
    );
  }
}
