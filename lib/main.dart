import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'equbamont.dart';
import 'homepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equb Type Selection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EqubSelectionScreen(),
    );
  }
}

class EqubSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            // Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, color: Colors.grey.shade700),
                ),
                SizedBox(width: 10),
                Text(
                  "Hi Eman Tsegaye",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Title
            Text(
              "Select Equb Type",
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Select your preferred equb type from the following options",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),

            SizedBox(height: 20),

            // Equb Type Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8, // Reduced aspect ratio to prevent overflow
                children: [
                  buildEqubCard(context, "Daily Equb", "Deposited: Every day", "Duration: 104 Days", "1"),
                  buildEqubCard(context, "Weekly Equb", "Deposited: Every week", "Duration: 20 Weeks", "7"),
                  buildEqubCard(context, "Biweekly Equb", "Deposited: Every 15 days", "Duration: 40 Weeks", "15"),
                  buildEqubCard(context, "Monthly Equb", "Deposited: Every month", "Duration: 6-12 Months", "30"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to create an Equb Type Card as a Button
  Widget buildEqubCard(BuildContext context, String title, String deposit, String duration, String dayNumber) {
    return GestureDetector(
       onTap: () {
        // If Daily Equb is clicked, navigate to Amount Selection Screen
        if (title == "Daily Equb") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AmountSelectionScreen()),
          );
        }
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
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Icon with Number Inside
            SizedBox(
              height: 45,
              width: 45,
              child: Stack(
                children: [
                  // Background Calendar Icon
                  Icon(Icons.calendar_today, size: 45, color: Colors.orangeAccent),
                  
                  // Number Inside the Calendar
                  Positioned(
                    top: 12,
                    left: 16,
                    child: Text(
                      dayNumber,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Title
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            // Description
            Flexible(
              child: Text(
                deposit,
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Flexible(
              child: Text(
                duration,
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Equb Detail Screen
class EqubDetailScreen extends StatelessWidget {
  final String equbType;

  EqubDetailScreen(this.equbType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(equbType, style: GoogleFonts.poppins())),
      body: Center(
        child: Text(
          "Details for $equbType",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
