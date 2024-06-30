import 'package:flutter/material.dart';
import 'package:rahul_portfolio/pages/about_page.dart';
import 'package:rahul_portfolio/widgets/drawer.dart';
import 'package:rahul_portfolio/widgets/responsive.dart';

import '../widgets/header_page.dart';
import 'landing_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: (Responsive.isMobile(context)) ? const AppDrawer() : null,
      body: const Column(
        children: [
          HeaderNavigation(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LandingPage(),
                  // Add other sections here if needed
                  AboutPage()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
