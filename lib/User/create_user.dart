import 'package:flutter/material.dart';
import 'package:bitgold/Widgets/Custombottomnavigation.dart';
import 'package:bitgold/Loan/create_loan.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        surfaceTintColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Create User",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/profile.png'), // Replace with your image asset
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {
                // Handle Add Photo action
              },
              child: Text(
                "Add photo",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            buildTextField("First Name", "Enter first name"),
            SizedBox(height: 10),
            buildTextField("Last Name", "Enter last name"),
            SizedBox(height: 10),
            buildTextField("Mobile Number", "Enter mobile number",
                keyboardType: TextInputType.phone),
            SizedBox(height: 10),
            buildTextField("Email Id", "Enter email",
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10),
            buildTextField("Address", "Enter address"),
            SizedBox(height: 10),
            buildTextField("Aadhar Number", "Enter Aadhar number",
                keyboardType: TextInputType.number),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100, // Width for the Cancel button
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle cancel action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.black, // Border color
                          width: 1, // Border width
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Optional spacing between buttons
                SizedBox(
                  width: 190, // Width for the Save & Create Loan button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to TrackDetailsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateLoanScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 212, 175, 55), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color:
                              Color.fromARGB(255, 212, 175, 55), // Border color
                          width: 1, // Border width
                        ),
                      ),
                    ),
                    child: Text(
                      "Save & Create Loan",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation bar item taps
        },
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 101, 95, 95) // Semi-bold for the label
              ),
        ),
        SizedBox(height: 5),
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText, // Placeholder text
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2), // Border radius
              borderSide: BorderSide(
                color: Color(0x655F5F), // Outline color for default
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2), // Same border radius
              borderSide: BorderSide(
                color: Color.fromARGB(
                    255, 101, 95, 95), // Outline color when focused
              ),
            ),
          ),
        ),
        SizedBox(height: 5), // Space between each input box
      ],
    );
  }
}
