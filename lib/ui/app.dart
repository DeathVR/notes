import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/router/app_navigator.dart';

import 'package:provider/provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            model.isDarkMode ? Colors.grey.shade900 : Colors.white,
        appBarTheme: const AppBarTheme(toolbarHeight: 64),
      ),
      initialRoute: AppNavigator.initialRoute,
      routes: AppNavigator.routes,
    );
  }
}
