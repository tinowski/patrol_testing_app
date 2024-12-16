import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/my_details.dart';
import 'screens/documents.dart';
import 'screens/my_trainings.dart';
import 'screens/contracts.dart';
import 'screens/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrol App',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.tealAccent,
          secondary: Colors.blueGrey[700]!,
          surface: Colors.black,
          background: Colors.grey[900]!,
          error: Colors.redAccent,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white60),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.tealAccent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.tealAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: LoginScreen(),
      routes: {
        '/my-details': (context) => MyDetailsScreen(),
        '/documents': (context) => DocumentsScreen(),
        '/my-trainings': (context) => MyTrainingsScreen(),
        '/contracts': (context) => ContractsScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
