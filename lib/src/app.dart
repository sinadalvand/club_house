import 'package:club_house/src/view/common/colors.dart' as colore;
import 'package:club_house/src/view/common/lang/AppTranslation.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:club_house/src/view/phone_number_page.dart';
import 'package:club_house/src/view/phone_verify_page.dart';
import 'package:club_house/src/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      initialRoute: Director.WELCOME.route,
      getPages: [
        GetPage(name: Director.WELCOME.route, page: () => WelcomePage()),
        GetPage(name: Director.SIGN_IN.route, page: () => PhoneNumberPage()),
        GetPage(
            name: Director.VERIFY_PHONE.route,
            page: () => PhoneNumberVerifyPage()),
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
