// main_screen.dart
import 'package:flutter/material.dart';
import 'homepage.dart'; // Your existing HomePage
import 'equbhome.dart'; // Your existing EqubHomePage

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // 0=Home, 1=Equb, 2=Edir, 3=Settings

  // List of pages to display based on the selected index
  final List<Widget> _pages = [
    HomePage(),    // Home Page
    EqubHomePage(),// Equb Page
    PlaceholderPage(title: "Edir Page"), // Edir Page (create similar to EqubHomePage)
    PlaceholderPage(title: "Settings Page"), // Settings Page
  ];

  // Update the AppBar title based on the current page
  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0: return "Home";
      case 1: return "Equb";
      case 2: return "Edir";
      case 3: return "Settings";
      default: return "App";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dynamic AppBar
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // Body changes based on selected page
      body: _pages[_currentIndex],
      // Fixed Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Equb'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Edir'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// Placeholder for Edir/Settings (replace with actual pages)
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}