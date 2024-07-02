import 'package:flutter/material.dart';
import 'responsive.dart'; // Make sure to import your Responsive class

class HeaderNavigation extends StatelessWidget {
  const HeaderNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileHeader(context),
      tablet: _buildDesktopHeader(),
      desktop: _buildDesktopHeader(),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'RAHUL ROY',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  Widget _buildDesktopHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'RAHUL ROY',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              _buildNavItem('HOME'),
              _buildNavItem('ABOUT'),
              _buildNavItem('SKILLS'),
              _buildNavItem('WORKS'),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFADFF00),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'HIRE ME',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          // Add navigation functionality
        },
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
