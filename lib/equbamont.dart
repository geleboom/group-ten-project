import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AmountSelectionScreen(),
  ));
}

class AmountSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> amountOptions = [
    {"amount": "300", "status": "Starts on : 09/03/2025", "total": "ETB 31,200.00"},
    {"amount": "500", "status": "Starts on : 09/03/2025", "total": "ETB 52,000.00"},
    {"amount": "1,000", "status": "Coming soon", "total": "ETB 104,000.00"},
    {"amount": "2,000", "status": "Coming soon", "total": "ETB 208,000.00"},
    {"amount": "3,000", "status": "Coming soon", "total": "ETB 312,000.00"},
    {"amount": "5,000", "status": "Coming soon", "total": "ETB 520,000.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Select Amount", style: GoogleFonts.poppins()),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Amount", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Select your preferred amount and number of participants", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 20),

            // Amount Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
                children: amountOptions.map((data) => AmountCard(data)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Amount Selection Card Widget
Widget AmountCard(Map<String, String> data) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    padding: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${data["amount"]} ETB", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(data["status"]!, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 5),
        Text("Total : ${data["total"]}", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 5),
        Text("Participants : 104", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
      ],
    ),
  );
}
