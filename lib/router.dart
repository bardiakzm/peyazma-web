import 'package:go_router/go_router.dart';
import 'package:peyazma_web/pages/about_us_page.dart';
import 'package:peyazma_web/pages/contact_us_page.dart';
import 'package:peyazma_web/pages/home_page.dart';
import 'package:peyazma_web/pages/projects_page.dart';
import 'package:peyazma_web/pages/services_page.dart';
import 'package:peyazma_web/pages/staff_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/staff',
        name: 'staff',
        builder: (context, state) => const Staff(),
      ),
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

  GoRouter get router => _router;
}
