import 'package:flutter/material.dart';

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
        elevation: 0,
        title: Text(
          "Gold Loan Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
              _buildDottedLine(),
              _buildStep(
                  "₹ 10,000 +2000", "No Transaction Done", "Apr 12th 2024",
                  isCompleted: false),
              _buildDottedLine(),
              _buildStep(
                  "₹ 10,000", "Transaction from SBI Account", "Mar 12th 2024",
                  isCompleted: true),
              _buildDottedLine(),
              _buildStep(
                  "₹ 10,000", "Transaction from SBI Account", "Feb 12th 2024",
                  isCompleted: true),
              _buildDottedLine(),
              _buildStep(
                  "₹ 10,000", "Transaction from SBI Account", "Jan 12th 2024",
                  isCompleted: true),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to create the amount cards
  Widget _buildAmountCard(
      String title, String amount, IconData icon, Color iconColor) {
    return Container(
      width: 150,
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
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 30, color: iconColor),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Steps for the transaction details
  Widget _buildStep(String amount, String status, String date,
      {bool isCompleted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.blue,
            size: 24,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    color: isCompleted ? Colors.green : Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
      width: 1,
      height: 100,
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DottedLinePainter({
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.color = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    double startX = 0;
    while (startX < size.height) {
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashWidth), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
