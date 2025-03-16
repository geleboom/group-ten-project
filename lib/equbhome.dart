import 'package:flutter/material.dart';
import 'bottomnav.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equb UI Example',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Orange theme
      ),
      home: EqubHomePage(),
    );
  }
}

class EqubHomePage extends StatefulWidget {
  @override
  _EqubHomePageState createState() => _EqubHomePageState();
}

class _EqubHomePageState extends State<EqubHomePage> {
  int _currentIndex = 1; // Set the initial index to 1 for Equb

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hi Kebede Ketema',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert, size: 18),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active Equb Details',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'Code: 00123',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Daily 5,000 ETB',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saved Amount',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              '25,000 ETB',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Remaining Amount',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              '425,000 ETB',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Upcoming Payment Date: 20-08-2024',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Next Winner Reveal',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimeBox(label: '02', unit: 'Days'),
                        TimeBox(label: '17', unit: 'Hours'),
                        TimeBox(label: '32', unit: 'Minutes'),
                        TimeBox(label: '34', unit: 'Seconds'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(label: 'Members', icon: Icons.group),
                ActionButton(label: 'Equb Lottery', icon: Icons.confirmation_number),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            TransactionItem(transactionCode: 'JZSI34KM', amount: '5,000 ETB', date: '19-08-2024'),
            TransactionItem(transactionCode: 'AGQYAVO4', amount: '5,000 ETB', date: '19-08-2024'),
            TransactionItem(transactionCode: 'CXCH5XEB', amount: '5,000 ETB', date: '19-08-2024'),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

// TimeBox widget to display time units
class TimeBox extends StatelessWidget {
  final String label;
  final String unit;

  TimeBox({required this.label, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4),
          Text(
            unit,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// ActionButton widget for Members and Equb Lottery
class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;

  ActionButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Add your action here
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}

// TransactionItem widget to display transactions
class TransactionItem extends StatelessWidget {
  final String transactionCode;
  final String amount;
  final String date;

  TransactionItem({required this.transactionCode, required this.amount, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.orange[50],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Transaction Code: $transactionCode', style: TextStyle(fontSize: 12)),
                Text('Amount: $amount', style: TextStyle(fontSize: 12)),
                Text('Date: $date', style: TextStyle(fontSize: 12)),
              ],
            ),
            Icon(Icons.arrow_forward, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
