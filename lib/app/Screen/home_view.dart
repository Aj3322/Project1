import 'package:animal/app/Screen/Pages/AssistancePage.dart';
import 'package:animal/app/Screen/Pages/HomePage.dart';
import 'package:animal/app/Screen/Pages/LocationPage.dart';
import 'package:animal/app/Screen/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeView extends GetView {
  final PageController _pageController = PageController();
  var currentPage = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (int index) {
          print('Page changed to: $index');
          currentPage.value = index;
        },
        children: const [
          // Home Page
          HomePage(),
          // Search Page
          LocationPage(),
          // Assistant Page
          AssistancePage(),
          // Profile Page
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Obx(() =>BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.blue),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: Colors.red),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city, color: Colors.blue),
            label: 'Search',
            activeIcon: Icon(Icons.location_city_outlined, color: Colors.red),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, color: Colors.blue),
            label: 'Searchesh',
            activeIcon: Icon(Icons.search, color: Colors.red),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.blue),
            label: 'Profile',
            activeIcon: Icon(Icons.person, color: Colors.red),
          ),
        ],
        currentIndex:  currentPage.value,
        onTap:  (index) {
          print('Tab tapped: $index');
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        selectedItemColor: Colors.red,
      ) ),
    );
  }
}

