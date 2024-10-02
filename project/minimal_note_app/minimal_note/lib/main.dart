// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_note/models/note_database.dart';
import 'package:minimal_note/theme/theme_provider.dart';
import 'pages/notes_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // Khởi tạo DB note
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
