import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/achievements_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pardeep Lohia Portfolio",
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.amber,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amber,
          surface: Colors.black,
          background: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Pardeep Lohia",
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      ),
      body: const SingleChildScrollView(
        child: HomeScreen(),
      ),
    );
  }
}
