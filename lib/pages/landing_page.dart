import 'package:flutter/material.dart';
import 'package:rahul_portfolio/utils/app_colors.dart';
import '../widgets/responsive.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(
            begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Responsive(
        mobile: _buildMobileLanding(context),
        tablet: _buildDesktopLanding(context),
        desktop: _buildDesktopLanding(context),
      ),
    );
  }

  Widget _buildMobileLanding(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMobileHeadline(context),
        const SizedBox(height: 20),
        _buildButtons(),
      ],
    );
  }

  Widget _buildDesktopLanding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeadline(),
                const SizedBox(height: 30),
                _buildButtons(),
              ],
            ),
          ),
          _buildImage(context),
        ],
      ),
    );
  }

  Widget _buildHeadline() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CODING WITH',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 60),
                    Text(
                      '🔥PASSION',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFADFF00),
                      ),
                    ),
                    Text(
                      ', CREATING',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  'WITH PURPOSE',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 420,
                  child: Text(
                    'Hello and welcome to my app developer portfolio. Im thrilled to showcase my passion for crafting capturing and functional apps',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileHeadline(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CODING WITH',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Row(
                  children: [
                    SizedBox(width: 3),
                    Text(
                      '🔥PASSION',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFADFF00),
                      ),
                    ),
                    Text(
                      ', CREATING',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'WITH PURPOSE',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Hello and welcome to my app developer portfolio. Im thrilled to showcase my passion for crafting capturing and functional apps',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Expanded(child: _buildImage(context))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.27,
      width: width * 0.3,
      decoration: const BoxDecoration(
        color: Color(0xFF3D3D3D),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile_image.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Add hire me functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            overlayColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.gesture_outlined),
              ),
              const SizedBox(width: 5),
              const Text(
                "Let's Talk",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(width: 20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              left: 30,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: accentColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 30),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Download CV",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ))
      ],
    );
  }
}
