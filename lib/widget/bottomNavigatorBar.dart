// ignore_for_file: file_names, use_super_parameters, unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/homePageScreen/homePageView.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePageScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.35),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      height: Platform.isIOS ? 96 : 80,
      child: ClipPath(
        clipper: CustomBottomAppBarClipper(),
        child: BottomAppBar(
          color: const Color.fromRGBO(227, 209, 93, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildNavItem(Icons.home, 'Accueil', 0),
                  _buildNavItem(Icons.group, 'Communauté', 1),
                ],
              ),
              Row(
                children: [
                  _buildNavItem(Icons.person, 'Mon profil', 2),
                  _buildNavItem(Icons.settings, 'Paramètres', 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        _onItemTapped(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double topRightRadius = 32.0;

    final Path path = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(size.width - topRightRadius, 0.0)
      ..arcToPoint(
        Offset(
          size.width,
          topRightRadius,
        ),
        radius: const Radius.circular(topRightRadius),
        clockwise: true,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
