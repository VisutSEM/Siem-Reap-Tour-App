import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:siem_reap_tour/const/colors.dart';
import '../view/favorite_screen.dart';
import '../view/front_page.dart';
import '../view/profile_screen.dart';
import '../view/search_sceen.dart';

class NavigateBottomBar extends StatefulWidget {
  const NavigateBottomBar({Key? key}) : super(key: key);

  @override
  State<NavigateBottomBar> createState() => _NavigateBottomBarState();
}

class _NavigateBottomBarState extends State<NavigateBottomBar> {
  int _currentIndex = 0;

  // Define your pages/screens here - ADD ALL YOUR SCREENS
  final List<Widget> _pages = [
    FrontPage(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Display the current page
          _pages[_currentIndex],

          // Bottom navigation bar positioned at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: 400,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: kWhiteColor.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildNavItem(
                              icon: Icons.home,
                              label: "Home",
                              index: 0,
                            ),
                            _buildNavItem(
                              icon: Icons.search,
                              label: "Search",
                              index: 1,
                            ),
                            _buildNavItem(
                              icon: Icons.bookmark_add,
                              label: "Favorites",
                              index: 2,
                            ),
                            _buildNavItem(
                              icon: Icons.person,
                              label: "Profile",
                              index: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = _currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          color: isSelected ? kBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? kWhiteColor : Colors.yellow,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? kWhiteColor : Colors.yellow,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
