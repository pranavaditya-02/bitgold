import 'package:flutter/material.dart';
import 'package:bitgold/Widgets/Custombottomnavigation.dart';
import 'package:bitgold/Tracker/transaction_details.dart'; // Make sure this import is correct

class GoldLoanDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        surfaceTintColor: Color.fromARGB(255, 250, 250, 250),
        title: Text('Gold Loan Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              // Add filter functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add settings functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: ListView.builder(
          itemCount: 4, // The number of loan cards you want to display
          itemBuilder: (context, index) {
            return LoanCard(
              loanAmount: '₹ 75,000',
              loanStatus: _getLoanStatus(index),
              dueDate: 'Dec 12th 2024',
              progress: _getProgress(index),
              completedMonths: _getCompletedMonths(index),
              totalMonths: 24,
              onTap: () {
                // Navigate to loan details when tapped
              },
            );
          },
        ),
      ),
      // Replace BottomNavigationBar with your custom navigation bar
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onTap: (index) {
            // Handle navigation bar item taps
            switch (index) {}
          }), // Assuming you have created CustomBottomNavigation
    );
  }

  String _getLoanStatus(int index) {
    if (index == 0) return 'Overdue';
    if (index == 1) return 'Active';
    return 'Paid';
  }

  double _getProgress(int index) {
    if (index == 0) return 0.10;
    if (index == 1) return 0.10;
    return 1.00;
  }

  int _getCompletedMonths(int index) {
    if (index == 0) return 5;
    if (index == 1) return 5;
    return 24;
  }
}

class LoanCard extends StatelessWidget {
  final String loanAmount;
  final String loanStatus;
  final String dueDate;
  final double progress;
  final int completedMonths;
  final int totalMonths;
  final VoidCallback onTap;

  LoanCard({
    required this.loanAmount,
    required this.loanStatus,
    required this.dueDate,
    required this.progress,
    required this.completedMonths,
    required this.totalMonths,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetailsScreen(),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          height: 175, // Increased height to 175
          padding: const EdgeInsets.all(12), // Adjust padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loan image with increased size
              Image.asset(
                'assets/goldloan.png',
                width: 85, // Image size
                height: 85,
              ),
              SizedBox(width: 10),
              // Loan amount on the left
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loanAmount,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[800],
                      ),
                    ),
                    // Add some spacing
                    SizedBox(height: 6),
                    // Progress bar
                    CustomProgressSlider(
                      progress: progress,
                      loanStatus: loanStatus,
                      activeColor: _getProgressColor(),
                      inactiveColor: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
              // Loan status, due date, and month aligned to the right
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, color: _getStatusColor()),
                      SizedBox(width: 4),
                      Text(
                        loanStatus,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Due: $dueDate',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$completedMonths / $totalMonths Month',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  // View Logs button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getButtonColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6, // Reduced padding for smaller button
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View Logs',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    if (loanStatus == 'Overdue') return Colors.red;
    if (loanStatus == 'Active') return Colors.orange;
    return Colors.green;
  }

  Color _getProgressColor() {
    if (loanStatus == 'Overdue') return Colors.red;
    if (loanStatus == 'Active') return Colors.orange;
    return Colors.green;
  }

  Color _getButtonColor() {
    if (loanStatus == 'Overdue')
      return Color.fromARGB(255, 212, 175, 55); // Gold
    if (loanStatus == 'Active')
      return Color.fromARGB(255, 212, 175, 55); // Gold
    if (loanStatus == 'Paid')
      return Color.fromARGB(255, 121, 145, 164); // Silver
    return Colors.blue.shade700;
  }
}

class CustomProgressSlider extends StatelessWidget {
  final double progress;
  final String loanStatus;
  final double sliderHeight;
  final Color activeColor;
  final Color inactiveColor;
  final double sliderWidth;

  CustomProgressSlider({
    required this.progress,
    required this.loanStatus,
    this.sliderHeight = 6.0,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.sliderWidth = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    double maxLabelPosition =
        sliderWidth - 50; // Ensure the label stays within bounds
    double labelPosition =
        (progress * sliderWidth).clamp(0.0, maxLabelPosition);
    double labelOffset = 20.0; // Distance between the label and the slider

    return Stack(
      children: [
        // Slider
        Container(
          height: 60,
          width: sliderWidth,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: sliderHeight,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              value: progress,
              min: 0,
              max: 1,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              onChanged: (value) {
                // Handle changes if the slider is interactive
              },
            ),
          ),
        ),
        // Percentage label
        Positioned(
          left: labelPosition,
          bottom: 40,
          // bottom: sliderHeight + labelOffset,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
