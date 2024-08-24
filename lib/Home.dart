import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'convert.dart';
import 'focuslist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation or other actions based on the selected index
    switch (index) {
      case 0:
        // Do something for Home
        break;
      case 1:
        // Do something for Add User
        break;
      case 2:
        // Do something for Tracker
        break;
      case 3:
        // Do something for Profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Path to your logo in the assets folder
              height: 50, // Increase the height as needed
              // Adjust the width if necessary, or let it scale proportionally
            ),
            SizedBox(width: 8), // Add some space between the logo and the text
            Text(
              'BITGOLD',
              style: TextStyle(
                color: Color(0xFFDBBC58),
                fontWeight: FontWeight.bold,
                fontSize: 24, // Adjust the font size as needed
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.settings, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Add User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              _buildHorizontalScrollCards(),
              SizedBox(height: 10),
              _buildInFocusToday(),
              SizedBox(height: 9),
              _buildTotalStatistics(context),
            ],
          ),
        );
      case 1:
        return Center(child: Text('Add User Page')); // Add User page content
      case 2:
        return Center(child: Text('Tracker Page')); // Tracker page content
      case 3:
        return Center(child: Text('Profile Page')); // Profile page content
      default:
        return Center(child: Text('Page not found'));
    }
  }

  Widget _buildHorizontalScrollCards() {
    return Container(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 16),
          _buildCustomCard(
            imagePath: 'assets/amountpending.png',
            title: "Total Amount Pending",
            amount: "₹24,234.00",
          ),
          SizedBox(width: 10),
          _buildCustomCard(
            imagePath: 'assets/personalloan.png',
            title: "Total Loan Pending",
            amount: "₹45,000.00",
          ),
          SizedBox(width: 10),
          _buildCustomCard(
            imagePath: 'assets/amountspent.png',
            title: "Total Amount Spent",
            amount: "₹12,000.00",
          ),
          SizedBox(width: 10),
          _buildCustomCard(
            imagePath: 'assets/amountrecieved.png',
            title: "Total Amount Received",
            amount: "₹60,000.00",
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildCustomCard({
    required String imagePath, // Replace icon with imagePath
    required String title,
    required String amount,
  }) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                amount,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInFocusToday() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'In Focus Today',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to ConvertScreen when the swap button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewAllScreen()),
                    );
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Container(
              height: 400, // Fixed height for the scrollable area
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    _buildInFocusItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                      name: 'Saravanan S',
                      duration: '4 Months left',
                      price: '₹4000.0',
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    _buildInFocusItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                      name: 'Anand B',
                      duration: '3 Months left',
                      price: '₹3000.0',
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    _buildInFocusItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                      name: 'Anand B',
                      duration: '3 Months left',
                      price: '₹3000.0',
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    _buildInFocusItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                      name: 'Anand B',
                      duration: '3 Months left',
                      price: '₹3000.0',
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    _buildInFocusItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                      name: 'Anand B',
                      duration: '3 Months left',
                      price: '₹3000.0',
                    ),
                    // Add more rows if needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInFocusItem({
    required String imageUrl,
    required String name,
    required String duration,
    required String price,
  }) {
    return Slidable(
      // Configure sliding behavior
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Handle action when icon is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Call action')),
              );
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.phone,
            label: 'Call',
          ),
        ],
      ),

      endActionPane: ActionPane(
        extentRatio: 0.78,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Paid action')),
              );
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: CupertinoIcons.check_mark,
            label: 'Paid',
          ),
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Add Flag',
                      style: TextStyle(
                        fontSize: 20, // Adjust text size as needed
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount Paid',
                          style: TextStyle(
                            fontSize: 16, // Adjust text size as needed
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Amount', // Placeholder text
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Border radius
                              borderSide: BorderSide(
                                  color: Colors.black), // Outline color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Same border radius
                              borderSide: BorderSide(
                                  color: Colors
                                      .black), // Outline color when focused
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: BorderSide(
                                  color: Colors.amber,
                                  width: 2), // Golden outline
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Same border radius as Save button
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          SizedBox(width: 90), // Spacer between buttons
                          ElevatedButton(
                            onPressed: () {
                              // Handle save action here
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.amber, // Text color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Same border radius as Cancel button
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.flag,
            label: 'Flag',
          ),
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Due action')),
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.access_time, // Using a clock icon for "Due"
            label: 'Due',
          ),
        ],
      ),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 1,
                      top: -10,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    Positioned(
                      right: -4,
                      bottom: -2,
                      child: Container(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          'assets/gold.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: 12, color: Colors.orange),
                        SizedBox(width: 6),
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFDBBC58),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalStatistics(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200, // Keep the minimum width
            ),
            child: TextButton(
              onPressed: () {
                // Add any functionality for Total Statistics button
              },
              child: Text(
                'Total Statistics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to ConvertScreen when the swap button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConvertScreen()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(217, 219, 188, 88), // Gold color
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Image.asset(
              'assets/Swap.png', // Path to your swap icon asset
              height: 25, // Icon height
              width: 25, // Icon width
            ),
          ),
        ],
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  final double right;
  final double holeRadius;

  DolDurmaClipper({this.right = 0, this.holeRadius = 0});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - right, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
