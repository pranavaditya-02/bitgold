import 'package:flutter/material.dart';
import 'package:bitgold/Custombottomnavigation.dart';
import 'package:bitgold/Tracker/gold_loan_details.dart';

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
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
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
              SizedBox(height: 15), // Space for top padding
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
                              horizontal: 10, vertical: 12),
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
                                    right: -4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.zero,
                                        width:
                                            140, // Reduced width to fit the content properly
                                        height: 40, // Adjusted height as needed
                                        child: OutlinedButton(
                                          onPressed: () {
                                            
                                            // Add your button press logic here
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Colors
                                                  .yellow, // Border color similar to the image
                                              width: 2, // Border width
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // Rounded corners
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    4), // Reduced button padding
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // Align text and icon to the start
                                            children: [
                                              Flexible(
                                                child: FittedBox(
                                                  fit: BoxFit
                                                      .scaleDown, // Scale down the text to fit the container
                                                  child: Text(
                                                    'Create New Loan',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .brown, // Text color
                                                      fontSize:
                                                          14, // Increased font size
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis, // Avoid text overflow
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      4), // Reduced space between text and icon
                                              Container(
                                                width:
                                                    20, // Adjusted size of the icon container
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .brown, // Background color for the icon
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8), // Rounded box for the icon
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors
                                                        .white, // Icon color
                                                    size:
                                                        14, // Slightly reduced icon size
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                    top: -25, // Slight overlap
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
                context,
                'Gold Loan',
                '₹75,000',
                '24 Month Tenure',
                'December 12th 2024',
                'assets/goldloan.png',
              ),
              SizedBox(height: 16),
              _buildLoanCard(
                context,
                'Silver Loan',
                '₹1,75,000',
                '18 Month Tenure',
                'December 12th 2024',
                'assets/silverloan.png',
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

  Widget _buildLoanCard(BuildContext context, String loanType, String amount,
      String tenure, String dueDate, String imagePath) {
    // Determine color based on loan type
    Color topBackgroundColor;
    Color textColor; // To set the text color based on the loan type
    if (loanType.toLowerCase() == 'gold loan') {
      topBackgroundColor = Color.fromARGB(255, 241, 204, 198); // Gold color
      textColor = Color.fromARGB(255, 185, 54, 34); // Gold text color
      imagePath = 'assets/goldloan.png'; // Gold-specific image
    } else if (loanType.toLowerCase() == 'silver loan') {
      topBackgroundColor = Color.fromARGB(255, 255, 202, 223); // Silver color
      textColor = Color.fromARGB(255, 181, 65, 111); // Silver text color
      imagePath = 'assets/silverloan.png'; // Silver-specific image
    } else {
      topBackgroundColor = Color(0xFFF7E0DC); // Default light pink color
      textColor = Colors.black; // Default text color
      imagePath = imagePath; // Use passed image path
    }

    return Container(
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white, // Background color for the entire card
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper section (dynamic colored background)
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: topBackgroundColor, // Dynamic background color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      loanType.toUpperCase(), // Loan type
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            textColor, // Dynamic text color based on loan type
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Current Active Plan',
                      style:
                          TextStyle(color: Color.fromARGB(255, 99, 125, 146)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 24, // Larger font for the amount
                        fontWeight: FontWeight.bold,
                        color: textColor, // Dynamic text color for amount
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(tenure,
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 125, 146))),
                  ],
                ),
                Spacer(), // Pushes the image to the right
                Image.asset(
                  imagePath,
                  width: 160,
                  height: 150,
                  fit: BoxFit.contain, // Ensure the image scales correctly
                ),
              ],
            ),
          ),
          // Lower section (white background)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next due date',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      dueDate,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit
                      .scaleDown, // Ensures the button scales to fit within the available space
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 172, 82, 68), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded edges
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8), // Adjust padding to control size
                      minimumSize:
                          Size(60, 40), // Minimum size (width and height)
                    ),
                    onPressed: () {
                      // Navigate based on loan type
                      if (loanType.toLowerCase() == 'gold loan') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GoldLoanDetails(), // Your gold loan details page
                          ),
                        );
                      } else {
                        // Handle other types of loans here
                      }
                    },
                    child: Text(
                      'View All loans >',
                      style: TextStyle(
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // Button text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
