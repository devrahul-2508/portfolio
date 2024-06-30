import 'package:flutter/material.dart';
import 'package:rahul_portfolio/widgets/spiral_icon.dart';

import '../widgets/responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Responsive(
          mobile: _buildMobileLayout(),
          tablet: _buildDesktopLayout(),
          desktop: _buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: Image(
              image: AssetImage(
                  'assets/images/about.jpeg'), // Replace with your image asset
              height: 500,
            ),
          ),
        ),
        _buildAboutMeWidget()
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: Image(
            image: AssetImage(
                'assets/images/about.jpeg'), // Replace with your image asset
            height: 500,
          ),
        ),
        _buildAboutMeWidget(),
      ],
    );
  }

  Widget _buildAboutMeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'About Me',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 500,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                  fontSize: 24, letterSpacing: 0.5, color: Colors.black),
              children: [
                TextSpan(
                  text:
                      'Hello, I am Rahul---a creative, driven mobile developer with ',
                ),
                TextSpan(
                  text: '3 years of experience',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text:
                      ' in the field. I thrive on turning imaginative ideas into digital realities, constantly seeking innovative ways to blend design and technology. I possess a strong foundation in ',
                ),
                TextSpan(
                  text: 'FRONT-END',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'BACK-END',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text:
                      ' development, as well as a keen eye for responsive design and user-centered interfaces.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        _buildSocialMediaChannels()
      ],
    );
  }

  Widget _buildSocialMediaChannels() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Follow Me",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpiralIcon(child: Icon(Icons.mediation_sharp)),
                SpiralIcon(child: Icon(Icons.mediation_sharp)),
                SpiralIcon(child: Icon(Icons.mediation_sharp)),
                SpiralIcon(child: Icon(Icons.mediation_sharp))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
