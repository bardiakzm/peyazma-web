import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peyazma_web/pages/about_us_page.dart' deferred as about_us;
import 'package:peyazma_web/pages/contact_us_page.dart' deferred as contact_us;
import 'package:peyazma_web/pages/home_page.dart';
import 'package:peyazma_web/pages/projects_page.dart' deferred as projects;
import 'package:peyazma_web/pages/services_page.dart' deferred as services;
import 'package:peyazma_web/pages/staff_page.dart' deferred as staff;
import 'package:peyazma_web/pages/organization_chart_page.dart'
    deferred as organization_chart;

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
        builder: (context, state) {
          return FutureBuilder(
            future: staff.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return staff.Staff();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/contactUs',
        name: 'contactUs',
        builder: (context, state) {
          return FutureBuilder(
            future: contact_us.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return contact_us.ContactUs();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/aboutUs',
        name: 'aboutUs',
        builder: (context, state) {
          return FutureBuilder(
            future: about_us.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return about_us.AboutUsPage();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/projects',
        name: 'projects',
        builder: (context, state) {
          return FutureBuilder(
            future: projects.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return projects.ProjectsPage();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/services',
        name: 'services',
        builder: (context, state) {
          return FutureBuilder(
            future: services.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return services.ServicesPage();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/organizationChart',
        name: 'organizationChart',
        builder: (context, state) {
          return FutureBuilder(
            future: organization_chart.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return organization_chart.OrganizationChart();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
