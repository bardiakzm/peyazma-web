import 'package:flutter/material.dart';
import 'package:peyazma_web/pages/about_us_page.dart';
import 'package:peyazma_web/pages/contact_us_page.dart';
import 'package:peyazma_web/pages/home_page.dart';
import 'package:peyazma_web/pages/projects_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: const HomePage().navLabel,
      routes: {
        '/': (context) => const HomePage(), // Root route
        '/home': (context) => const HomePage(), // home route
        '/contactUs': (context) => const ContactUs(), // contact us route
        '/aboutUs': (context) => const AboutUsPage(), // about us route
        '/projects': (context) => const ProjectsPage(), // projects route
      },
    );
  }
}
