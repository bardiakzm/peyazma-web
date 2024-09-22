import 'package:flutter/material.dart';
import 'package:peyazma_web/pages/contact_us.dart';
import 'package:peyazma_web/pages/home_page.dart';

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
        '/contactUs': (context) => const ContactUs(), // home route
      },
    );
  }
}
