import 'package:flutter/material.dart';
import 'package:peyazma_web/pages/about_us_page.dart';
import 'package:peyazma_web/pages/contact_us_page.dart';
import 'package:peyazma_web/pages/home_page.dart';
import 'package:peyazma_web/pages/projects_page.dart';
import 'transitions.dart';
import 'package:peyazma_web/pages/services_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        // GoRoute(
        //   path: '/home',
        //   name: 'home',
        //   builder: (context, state) => const HomePage(),
        // ),
        GoRoute(
          path: '/contactUs',
          name: 'contactUs',
          builder: (context, state) => const ContactUs(),
        ),
        GoRoute(
          path: '/aboutUs',
          name: 'aboutUs',
          builder: (context, state) => const AboutUsPage(),
        ),
        GoRoute(
          path: '/projects',
          name: 'projects',
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(
          path: '/services',
          name: 'services',
          builder: (context, state) => const ServicesPage(),
        ),
      ],
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: NoTransitionsOnWeb(),
      ),
      routerConfig: router,
    );
  }
}
