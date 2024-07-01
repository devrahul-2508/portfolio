import 'package:flutter/material.dart';
import 'package:rahul_portfolio/utils/app_colors.dart';

import '../widgets/responsive.dart';

// Your Responsive widget code here

class SkillsPage extends StatelessWidget {
  SkillsPage({super.key});

  final List<Skill> skills = [
    Skill(
        icon: Icons.code,
        title: 'Front-end Development',
        description:
            'I am an expert in HTML5, CSS3, JavaScript, ES6+, React, Vue.js'),
    Skill(
        icon: Icons.storage,
        title: 'Back-end Development',
        description:
            'I am an expert in using Node.js, Express, Python, Django'),
    Skill(
        icon: Icons.storage_outlined,
        title: 'Database Management',
        description: 'I am an expert in using MySQL, MongoDB, PostgreSQL'),
    Skill(
        icon: Icons.history,
        title: 'Version Control',
        description:
            'I am an expert in using Git, GitHub, BitBucket, Processing the best'),
    Skill(
        icon: Icons.devices,
        title: 'Responsive Design',
        description:
            'Creating visually appealing and functional websites across devices'),
    Skill(
        icon: Icons.design_services,
        title: 'UI/UX Design',
        description: 'Wire-framing, prototyping, user flow analysis'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Responsive(
        mobile: SkillsGrid(crossAxisCount: 1, skills: skills),
        tablet: SkillsGrid(crossAxisCount: 2, skills: skills),
        desktop: SkillsGrid(crossAxisCount: 3, skills: skills),
      ),
    );
  }
}

class SkillsGrid extends StatelessWidget {
  final int crossAxisCount;
  final List<Skill> skills;

  const SkillsGrid({
    Key? key,
    required this.crossAxisCount,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: (Responsive.isMobile(context)) ? 900 : 700,
            child: Text(
              "I SPECIALIZE IN A RANGE OF 💪 SKILLS",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: (Responsive.isMobile(context)) ? 40 : 60,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillCard(skill: skills[index]);
            },
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({Key? key, required this.skill}) : super(key: key);

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHovered ? accentColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isHovered ? accentColor : Colors.grey, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? accentColor.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.skill.icon,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 12),
              Text(
                widget.skill.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                widget.skill.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isHovered ? Colors.black87 : Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Skill {
  final IconData icon;
  final String title;
  final String description;

  Skill({required this.icon, required this.title, required this.description});
}
