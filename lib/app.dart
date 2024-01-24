import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: IAppTheme.lightTheme,
        darkTheme: IAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: IColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: IColors.white,
            ),
          ),
        ));
  }
}
