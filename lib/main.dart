import 'package:flutter/material.dart';
import 'package:peyazma_web/pages/about_us_page.dart';
import 'package:peyazma_web/pages/contact_us_page.dart';
import 'package:peyazma_web/pages/home_page.dart';
import 'package:peyazma_web/pages/projects_page.dart';
import 'transitions.dart';
import 'package:peyazma_web/pages/services_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: NoTransitionsOnWeb(),
      ),
      // home: HomePage(),
      initialRoute: const HomePage().navLabel,
      routes: {
        '/': (context) => const HomePage(), // Root route
        '/home': (context) => const HomePage(), // home route
        '/contactUs': (context) => const ContactUs(), // contact us route
        '/aboutUs': (context) => const AboutUsPage(), // about us route
        '/projects': (context) => const ProjectsPage(), // projects route
        '/services': (context) => const ServicesPage(), // projects route
      },
    );
  }
}
