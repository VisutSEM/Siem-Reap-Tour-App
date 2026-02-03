import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siem_reap_tour/const/colors.dart';
import 'package:siem_reap_tour/screen/front_page.dart';

import '../view/guide_screen.dart';

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
    SearchPage(),
    FavoritesPage(),
    ProfilePage(),
    GuideScreen(),
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
                  child: Container(
                    width: 400,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
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
                            icon: Icons.favorite,
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
            Icon(icon, color: isSelected ? kWhiteColor : Colors.grey, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? kWhiteColor : Colors.grey,
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

// Placeholder pages
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Center(
        child: Text(
          'Search Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Center(
        child: Text(
          'Favorites Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
