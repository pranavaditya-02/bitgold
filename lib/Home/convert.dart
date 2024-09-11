import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:bitgold/Custombottomnavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConvertScreen(),
    );
  }
}

class ConvertScreen extends StatefulWidget {
  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  int _selectedSegment = 0; // For Gold/Silver selection
  int _selectedGoldOption = 22; // Default selection for 22KT
  int _selectedIndex = 0; // Bottom Navigation Index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Handle other navigation cases if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Adjusted height to fit content
        child: AppBar(
          surfaceTintColor: Color(0xFFFAFAFA),
          backgroundColor: Color(0xFFFAFAFA),
          title: Text(
            'Convert',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
          ],
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 100.0),

            // Adjust top padding as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFD7D9E4), // Background container color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CupertinoSegmentedControl<int>(
                    pressedColor: Colors.transparent,
                    children: {
                      0: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          color: _selectedSegment == 0
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Gold',
                          style: TextStyle(
                            color: _selectedSegment == 0
                                ? Colors.black
                                : Color(0xFF5C5C70),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      1: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          color: _selectedSegment == 1
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Silver',
                          style: TextStyle(
                            color: _selectedSegment == 1
                                ? Colors.black
                                : Color(0xFF5C5C70),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    },
                    selectedColor: Colors.transparent,
                    unselectedColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    groupValue: _selectedSegment,
                    onValueChanged: (int value) {
                      setState(() {
                        _selectedSegment = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            buildNetAndGrossWeightCard(),
            SizedBox(height: 10),
            buildConversionCard(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:
            _onItemTapped, // Handle item taps and pass to CustomBottomNavigationBar
      ),
    );
  }

  // Card that combines Net Weight, Gross Weight, and Convert button
  Widget buildNetAndGrossWeightCard() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal padding
      child: Card(
        color: Colors.white, // Set card background color to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Optional: rounded corners
        ),
        elevation: 4, // Optional: shadow effect
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Net Weight',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600, // Semi-bold
                        ),
                      ),
                      SizedBox(width: 8), // Spacing between text and icon
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey), // Light grey border
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Icon(Icons.add, size: 14),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Gross Weight',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600, // Semi-bold
                        ),
                      ),
                      SizedBox(width: 8), // Spacing between text and icon
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey), // Light grey border
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_forward_ios, size: 14),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600, // Semi-bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedGoldOption = 22;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedGoldOption == 22
                            ? Colors.yellow.shade700
                            : Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      '22KT/G',
                      style: TextStyle(
                        color: _selectedGoldOption == 22
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedGoldOption = 18;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedGoldOption == 18
                          ? Colors.yellow.shade700
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      '18KT/G',
                      style: TextStyle(
                        color: _selectedGoldOption == 18
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedGoldOption = 24;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedGoldOption == 24
                          ? Colors.yellow.shade700
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      '24KT/G',
                      style: TextStyle(
                        color: _selectedGoldOption == 24
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Net Weight',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter net weight', // Placeholder text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2), // Border radius
                    borderSide: BorderSide(
                        color: Colors.grey.shade300), // Outline color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(2), // Same border radius
                    borderSide: BorderSide(
                        color:
                            Colors.grey.shade600), // Outline color when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              Text(
                'Gross Weight',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter gross weight', // Placeholder text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2), // Border radius
                    borderSide: BorderSide(
                        color: Colors.grey.shade300), // Outline color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement convert functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9096A2),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Convert',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card builder function for Conversion section (18KT to 22KT example)
  Widget buildConversionCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Row with Icons and Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // From Section
                  Row(
                    children: [
                      Image.asset(
                        'assets/Gold star.png',
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '18KT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Swap Icon inside a box
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 255, 255), // Background color of the box
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    child: Icon(
                      Icons.swap_horiz,
                      size: 32,
                      color: Colors.grey[500],
                    ),
                  ),
                  // To Section (Swapped position)
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'To',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '22KT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Image.asset(
                        'assets/Gold coin.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 24),
              // Input Label
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Weight of the 18KT gold',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600, // Semi-bold
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Input Field
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter  weight in Grams', // Placeholder text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2), // Border radius
                    borderSide: BorderSide(
                        color: Colors.grey.shade300), // Outline color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(2), // Same border radius
                    borderSide: BorderSide(
                        color:
                            Colors.grey.shade600), // Outline color when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement convert functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9096A2),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Convert',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              // Result Display
            ],
          ),
        ),
      ),
    );
  }
}
