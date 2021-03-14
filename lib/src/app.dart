import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/Development/Projects/Flutter/club_house/lib/src/view/common/colors.dart' as colore;

import 'view/welcome_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Club House',
      theme: themeChooser(true),
      home: WelcomePage(),
    );
  }

  themeChooser(dark) {
    final theme = ThemeData(
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

    return dark ?
    theme.copyWith(
      scaffoldBackgroundColor: colore.Colors.DarkCarbon,
      textTheme: TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: colore.Colors.DarkCarbon,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    ) : theme;
  }
}

