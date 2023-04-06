import 'package:flutter/cupertino.dart';
import 'package:notes/ui/pages/add_page.dart';
import 'package:notes/ui/pages/edit_page.dart';
import 'package:notes/ui/pages/home_page.dart';
import 'package:notes/ui/pages/search_page.dart';
import 'package:notes/ui/router/app_routes.dart';

class AppNavigator {
  static String get initialRoute => AppRoutes.home;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.search: (context) => const SearchPage(),
        AppRoutes.edit: (context) => const EditPage(),
        AppRoutes.add: (context) => const AddPage(),
      };
}
