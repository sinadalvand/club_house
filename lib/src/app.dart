import 'package:club_house/src/view/common/colors.dart' as colore;
import 'package:club_house/src/view/common/lang/AppTranslation.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:club_house/src/view/full_name_page.dart';
import 'package:club_house/src/view/phone_number_page.dart';
import 'package:club_house/src/view/phone_verify_page.dart';
import 'package:club_house/src/view/pick_photo_page.dart';
import 'package:club_house/src/view/username_page.dart';
import 'package:club_house/src/view/waitlist_page.dart';
import 'package:club_house/src/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/FullnamePageController.dart';
import 'controller/PhonePageController.dart';
import 'controller/PhoneVerifyController.dart';
import 'controller/UsernamePageController.dart';
import 'controller/WelcomePageController.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'club_house'.tr,
      locale: AppTranslation.locale,
      fallbackLocale: AppTranslation.fallbackLocale,
      translations: AppTranslation(),
      theme: themeChooser(true),
      initialRoute: Director.REGISTER_USERNAME.route,
      getPages: [
        GetPage(name: Director.WELCOME.route, page: () => WelcomePage(),binding: BindingsBuilder((){
          Get.lazyPut(() => WelcomePageController());
        })),
        GetPage(name: Director.SIGN_IN.route, page: () => PhoneNumberPage(), binding: BindingsBuilder(() {
          Get.lazyPut<PhonePageController>(() => PhonePageController());
        })),
        GetPage(name: Director.VERIFY_PHONE.route, page: () => PhoneNumberVerifyPage(),binding: BindingsBuilder((){
          Get.lazyPut(() => PhoneVerifyController());
        })),
        GetPage(name: Director.WAIT_LIST.route, page: () => WaitListPage()),
        GetPage(name: Director.REGISTER_NAME.route, page: () => FullNamePage(),binding: BindingsBuilder((){
          Get.lazyPut(() => FullNamePageController());
        })),
        GetPage(name: Director.REGISTER_USERNAME.route, page: () => UsernamePage(),binding: BindingsBuilder((){
          Get.lazyPut(() => UsernamePageController());
        })),
        GetPage(name: Director.REGISTER_PROPIC.route, page: () => PickPhotoPage()),
        // GetPage(name: Director.WAIT_LIST.route, page: () => WaitListPage()),
      ],
    );
  }

  themeChooser(dark) {
    final theme = ThemeData(
      fontFamily: 'vazir',
      accentColor: colore.Colors.AccentBlue,
      scaffoldBackgroundColor: colore.Colors.LightBrown,
      appBarTheme: AppBarTheme(
        color: colore.Colors.LightBrown,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );

    return dark
        ? theme.copyWith(
            scaffoldBackgroundColor: colore.Colors.DarkCarbon,
            textTheme: theme.textTheme.copyWith(
              bodyText2: theme.textTheme.bodyText2.copyWith(
                color: Colors.white,
              ),
            ),
            appBarTheme: AppBarTheme(
              color: colore.Colors.DarkCarbon,
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
          )
        : theme;
  }
}
