// homepage.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottomnav.dart'; // Import the bottom navigation bar

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome, Eman Tsegaye", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // Large container for Equb & Edir stats
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatBox("Equb Joined", "5"),
                  buildStatBox("Edir Joined", "3"),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Scrollable Grid of Cards
            Expanded(
              child: SingleChildScrollView(
                child: GridView.count(
                  crossAxisCount: 2, // Now 2 cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2, // Smaller card size
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
                  children: [
                    buildMainCard("Payment", Icons.payment, Colors.greenAccent),
                    buildMainCard("Join Equb", Icons.group, Colors.orangeAccent),
                    buildMainCard("Join Edir", Icons.people, Colors.blueAccent),
                    buildMainCard("Transactions", Icons.receipt, Colors.purpleAccent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  // Function to create the Equb & Edir stat boxes
  Widget buildStatBox(String title, String value) {
    return Column(
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 12, color: Colors.black)),
        SizedBox(height: 5),
        Text(value, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Function to create the main cards (Payment, Join Equb, Join Edir, Transactions)
  Widget buildMainCard(String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Add your navigation logic here
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 8),
            Text(title, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}