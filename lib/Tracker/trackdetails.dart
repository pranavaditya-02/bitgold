import 'package:flutter/material.dart';
import 'package:bitgold/Custombottomnavigation.dart';

class TrackDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          'Track Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Space for top padding
              Stack(
                clipBehavior: Clip.none, // Allow overflow for the profile image
                children: [
                  // Main card (Background white box)
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.grey[300]!, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left section (Profile details)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 50), // Space for image overlap
                            Text(
                              'Saravanan S',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[700],
                              ),
                            ),
                            SizedBox(height: 4),

                            Row(
                              children: [
                                Icon(Icons.phone, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  '9566987439',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            // Inside your Column
                            _buildLoanInfoChip(
                                '5', 'Active Gold Loans', Colors.amber),
                            SizedBox(height: 8),
                            _buildLoanInfoChip(
                                '5', 'Active Silver Loans', Colors.amber),
                          ],
                        ),
                        // Vertical Divider
                        Container(
                          width: 1,
                          height: 170,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          color: Colors.grey[300],
                        ),
                        // Right section (Loan summary)
                        // Right section (Loan summary)
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Use a Stack to overlay the ID number
                              Stack(
                                children: [
                                  // Column for loan summary chips
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 70),
                                      // Loan summary chips
                                      _buildLoanSummaryChip(
                                          '15', 'Total Loans', Colors.amber),
                                      SizedBox(height: 8),
                                      _buildLoanSummaryChip(
                                          '2', 'Gold loan Overdue', Colors.red),
                                      SizedBox(height: 8),
                                      _buildLoanSummaryChip('2',
                                          'Silver loan Overdue', Colors.red),
                                    ],
                                  ),
                                  // Positioned ID number at the top right
                                  Positioned(
                                    top: 10,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '00000017738',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),

                        Spacer(),
                      ],
                    ),
                  ),
                  // Profile Image (Overlapping circle avatar)
                  Positioned(
                    left: 40, // Align left with the card
                    top: -30, // Slight overlap
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              // Additional sections for other loan details...
              _buildLoanCard(
                'Gold Loan',
                '₹75,000',
                '24 Month Tenure',
                'December 12th 2024',
                'assets/gold.png',
              ),
              SizedBox(height: 16),
              _buildLoanCard(
                'Silver Loan',
                '₹1,75,000',
                '18 Month Tenure',
                'December 12th 2024',
                'assets/gold.png',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation bar taps
        },
      ),
    );
  }

  Widget _buildLoanInfoChip(String count, String label, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: color.withOpacity(0.2),
          child: Text(
            count, // Display the count inside the CircleAvatar
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 8), // Space between CircleAvatar and text
        Text(
          label,
          style: TextStyle(
              color: Color.fromARGB(
                  255, 212, 175, 55), // Adjusted to grey for consistency
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildLoanSummaryChip(String count, String label, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: color.withOpacity(0.2),
          child: Text(count, style: TextStyle(color: color)),
        ),
        SizedBox(width: 8),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildLoanCard(String loanType, String amount, String tenure,
      String dueDate, String imagePath) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 80, height: 80),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loanType,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('Current Active Plan'),
              SizedBox(height: 4),
              Text(
                amount,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(tenure),
              SizedBox(height: 16),
              Text(
                'Next due date',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                dueDate,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              // Handle view all loans
            },
            child: Text('View All loans >'),
          ),
        ],
      ),
    );
  }
}
