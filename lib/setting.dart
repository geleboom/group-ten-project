import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(), // Using Poppins font
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          _buildSettingsItem(Icons.book, 'Rules', context),
          _buildSettingsItem(Icons.lock, 'Change Password', context),
          _buildSettingsItem(Icons.delete, 'Delete Account', context, color: Colors.red),
          _buildSettingsItem(Icons.language, 'Language', context),
          _buildSettingsItem(Icons.email, 'Contact Us', context),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, BuildContext context, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 16, color: color)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
