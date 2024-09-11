import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'convert.dart';
import 'focuslist.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bitgold/Custombottomnavigation.dart';

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

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: true),
            titlesData: const FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 1),
                  const FlSpot(1, 3),
                  const FlSpot(2, 10),
                  const FlSpot(3, 7),
                  const FlSpot(4, 12),
                  const FlSpot(5, 13),
                  const FlSpot(6, 17),
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
              LineChartBarData(
                spots: [
                  const FlSpot(0, 5),
                  const FlSpot(1, 2),
                  const FlSpot(2, 0),
                  const FlSpot(3, 4),
                  const FlSpot(4, 10),
                  const FlSpot(5, 12),
                  const FlSpot(6, 15),
                ],
                isCurved: true,
                color: Colors.black,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minY: 0,
            maxY: 20,
          ),
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isInFocusExpanded = true;
  bool _isTotalStatisticsExpanded = false;
  final ExpansionTileController focustoday = ExpansionTileController();
  final ExpansionTileController totalstates = ExpansionTileController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation or other actions based on the selected index
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFFAFAFA),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Path to your logo in the assets folder
                  height: 50, // Increase the height as needed
                ),
                const SizedBox(
                    width: 8), // Add some space between the logo and the text
                const Text(
                  'BITGOLD',
                  style: TextStyle(
                    color: Color(0xFFDBBC58),
                    fontWeight: FontWeight.bold,
                    fontSize: 24, // Adjust the font size as needed
                  ),
                ),
              ],
            ),
            actions: const [
              Icon(Icons.settings, color: Colors.black),
              SizedBox(width: 16),
            ],
          ),
          body: _buildBody(),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap:
                _onItemTapped, // Handle item taps and pass to CustomBottomNavigationBar
          ),
        ),
        Positioned(
          bottom:
              70, // Adjust this value based on your bottom navigation bar height
          right: 16, // Padding from the left edge
          child: TextButton(
            onPressed: () {
              // Navigate to ConvertScreen when the swap button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConvertScreen()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 190, 148, 68), // Gold color
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Image.asset(
              'assets/Swap.png', // Path to your swap icon asset
              height: 35, // Icon height
              width: 25, // Icon width
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          _buildHorizontalScrollCards(),
          const SizedBox(height: 6),
          _buildInFocusToday(),
          const SizedBox(height: 4),
          _buildTotalStatistics(context),
        ],
      ),
    );
    // Do something for Profile
  }

  Widget _buildHorizontalScrollCards() {
    return Container(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          _buildCustomCard(
            imagePath: 'assets/amountpending.png',
            title: "Total Amount Pending",
            amount: "₹24,234.00",
          ),
          const SizedBox(width: 10),
          _buildCustomCard(
            imagePath: 'assets/personalloan.png',
            title: "Total Loan Pending",
            amount: "₹45,000.00",
          ),
          const SizedBox(width: 10),
          _buildCustomCard(
            imagePath: 'assets/amountspent.png',
            title: "Total Amount Spent",
            amount: "₹12,000.00",
          ),
          const SizedBox(width: 10),
          _buildCustomCard(
            imagePath: 'assets/amountrecieved.png',
            title: "Total Amount Received",
            amount: "₹60,000.00",
          ),
          const SizedBox(width: 16),
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                amount,
                style: const TextStyle(
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
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent, // Removes the black line
      ),
      child: ExpansionTile(
        controller: focustoday,
        initiallyExpanded: _isInFocusExpanded,
        onExpansionChanged: (value) {
          setState(() {
            _isInFocusExpanded = value;
            if (value) {
              _isTotalStatisticsExpanded = false;
              totalstates.collapse();
            }
          });
        },
        trailing: TextButton(
          onPressed: () {
            // Navigate to ConvertScreen when the swap button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewAllScreen()),
            );
          },
          child: const Text(
            'View All',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        title: const Text(
          'In Focus Today',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        tilePadding: const EdgeInsets.symmetric(horizontal: 22),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 400, // Fixed height for the scrollable area
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
          ),
        ],
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
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Handle action when icon is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Call action')),
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
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Paid action')),
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
                    title: const Text(
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
                        const Text(
                          'Amount Paid',
                          style: TextStyle(
                            fontSize: 16, // Adjust text size as needed
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Amount', // Placeholder text
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Border radius
                              borderSide: const BorderSide(
                                  color: Colors.black), // Outline color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Same border radius
                              borderSide: const BorderSide(
                                  color: Colors
                                      .black), // Outline color when focused
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                          ),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
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
                              side: const BorderSide(
                                  color: Colors.amber,
                                  width: 2), // Golden outline
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Same border radius as Save button
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          const SizedBox(width: 90), // Spacer between buttons
                          ElevatedButton(
                            onPressed: () {
                              // Handle save action here
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.amber, // Text color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Same border radius as Cancel button
                              ),
                            ),
                            child: const Text(
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
                const SnackBar(content: Text('Due action')),
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                        decoration: const BoxDecoration(
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
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 12, color: Colors.orange),
                        const SizedBox(width: 6),
                        Text(
                          duration,
                          style: const TextStyle(
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
              style: const TextStyle(
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent, // Removes the black line
        ),
        child: ExpansionTile(
          controller: totalstates,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Statistics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          initiallyExpanded: _isTotalStatisticsExpanded,
          // enabled: _isTotalStatisticsExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _isTotalStatisticsExpanded = expanded;
              if (expanded) {
                _isInFocusExpanded = false;
                focustoday.collapse();
              }
            });
          },
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 400,
              child: LineChartSample(), // Your line chart widget
            ),
          ],
        ),
      ),
    );
  }
}
