import 'package:flutter/material.dart';
import 'package:bitgold/Custombottomnavigation.dart';

class TransactionDetailsScreen extends StatefulWidget {
  @override
  _TransactionDetailsScreenState createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        surfaceTintColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
        title: Text(
          "Gold Loan Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Amount summary cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAmountCard("Paid Amount", "₹ 30,000", Icons.monetization_on,
                  Colors.orange),
              _buildAmountCard("Total Amount", "₹ 75,000",
                  Icons.account_balance_wallet, Colors.red),
            ],
          ),
          SizedBox(height: 20),
          // Transaction steps with dotted lines
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStep("₹ 8,000", "No Transaction Done", "May 12th 2024",
                  isCompleted: false),
              _buildStep("₹ 10,000", "No Transaction Done", "Apr 12th 2024",
                  isCompleted: false, isSpecialAmount: true),
              _buildStep(
                  "₹ 10,000", "Transaction from SBI Account", "Mar 12th 2024",
                  isCompleted: true),
              _buildStep(
                  "₹ 10,000", "Transaction from SBI Account", "Feb 12th 2024",
                  isCompleted: true),
              _buildStep(
                  "₹ 10,000", "Transaction from SBI Account", "Jan 12th 2024",
                  isCompleted: true, bottom: true),
            ],
          ),
        ],
      ),
      // Bottom Navigation Bar added here
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onTap: (index) {
            // Handle navigation bar item taps
            switch (index) {}
          }),
    );
  }

  // Widget to create the amount cards
  Widget _buildAmountCard(
      String title, String amount, IconData icon, Color iconColor) {
    return Container(
      width: 160, // Increase the width here
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon section on the left
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 30, color: iconColor),
          ),
          SizedBox(width: 8), // Space between icon and text
          // Text section on the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 4), // Small space between title and amount
              Text(
                amount,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Updated steps for the transaction details
  Widget _buildStep(
    String amount,
    String status,
    String date, {
    bool isCompleted = false,
    bool isSpecialAmount = false,
    bool bottom = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding applied to the Column containing the Icon and Dotted Line
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0), // Moves stepper to the right
            child: Column(
              children: [
                Icon(
                  isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: isCompleted ? Colors.green : Colors.blue,
                  size: 28,
                ),
                bottom ? Container() : _buildDottedLine(),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: amount,
                        style: TextStyle(
                          color: isSpecialAmount
                              ? Colors.orange
                              : (isCompleted ? Colors.green : Colors.blue),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isSpecialAmount)
                        TextSpan(
                          text: " +2000",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDottedLine() {
    return Container(
      width: 2, // Width of the dotted line
      height: 55, // Height of the dotted line
      child: CustomPaint(
        painter: DottedLinePainter(), // Reference the CustomPainter here
      ),
    );
  }
}

// Custom painter for dotted line
class DottedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DottedLinePainter({
    this.dashWidth = 10,
    this.dashSpace = 5,
    this.color = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startY = 0; // For vertical dotted line, use Y-axis
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
