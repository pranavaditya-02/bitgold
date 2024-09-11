import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitgold/Custombottomnavigation.dart';
import 'package:bitgold/Tracker/track_details.dart'; // Assuming CustomBottomNavigationBar is defined elsewhere

class CreateLoanScreen extends StatefulWidget {
  @override
  _CreateLoanScreenState createState() => _CreateLoanScreenState();
}

class _CreateLoanScreenState extends State<CreateLoanScreen> {
  String selectedMetal = 'Gold'; // Default to Gold
  String jewelCart = '24KT'; // Default to 24KT
  int currentStep = 1; // Track current step
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        surfaceTintColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
        title: Text('Create Loan', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Segmented Control
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFFD7D9E4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CupertinoSegmentedControl<int>(
                  pressedColor: Colors.transparent,
                  children: {
                    0: _buildSegment('Gold', 0),
                    1: _buildSegment('Silver', 1),
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
              SizedBox(height: 2),

              // Stepper
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepCircle(1),
                  Container(width: 40, height: 2, color: Colors.grey),
                  _buildStepCircle(2),
                ],
              ),
              SizedBox(height: 10),

              if (currentStep == 1) _buildStepOneFields(), // First step fields
              if (currentStep == 2) _buildStepTwoFields(), // Second step fields

              SizedBox(height: 20),
              if (currentStep == 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Go back to step 1
                          currentStep = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackDetailScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 212, 175, 55),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              if (currentStep == 1)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Proceed to the next step
                        if (currentStep == 1) {
                          currentStep = 2; // Move to step 2
                        } else {
                          // Handle final submission
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 212, 175, 55),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      currentStep == 1 ? 'Save & Next' : 'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20),
            ],
          ),
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

  Widget _buildSegment(String title, int index) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      decoration: BoxDecoration(
        color: _selectedSegment == index ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: _selectedSegment == index ? Colors.black : Color(0xFF5C5C70),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step) {
    return CircleAvatar(
      radius: 15,
      backgroundColor:
          currentStep >= step ? Colors.amber[600] : Colors.grey[300],
      child: Text(
        '$step',
        style: TextStyle(
          color: currentStep >= step ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildStepOneFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // File Upload Section
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle file upload
                },
                child: Text(
                  'Choose File',
                  style: TextStyle(color: Colors.amber[700]),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Note: Only Images JPG, JPEG, PNG are allowed.\nImages should be less than 20 MB.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              // Uploaded Image Preview Section
              Row(
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('File name 1',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('File size 1.2 MB',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      // Handle delete file
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),

        // Jewel Cart Fields
        if (_selectedSegment == 0) _buildJewelCartFields(),
        _buildTextField('Net Weight', 'Enter net weight'),
        _buildTextField('Quality', 'Enter quality'),
      ],
    );
  }

  Widget _buildStepTwoFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Amount', 'Enter amount'),
        _buildTextField('Rate of Interest', 'Enter interest rate'),
        _buildTextField('Duration', 'Enter duration'),
        _buildDropdownField('Type of Payment'),
        _buildTextField('Monthly Payment', 'Enter monthly payment'),
        _buildTextField('Locker Number', 'Enter locker number'),
        _buildTextField('Loan Number', 'Enter loan number'),

        SizedBox(height: 20),

        // File upload section
      ],
    );
  }

  Widget _buildJewelCartFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jewel Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            _buildRadioOption('24KT'),
            _buildRadioOption('22KT'),
            _buildRadioOption('18KT'),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Padding around the field
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12), // Internal padding
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(8), // Rounded corners
              border: Border.all(color: Colors.grey[300]!), // Border color
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: InputBorder.none, // Remove default border
                contentPadding:
                    EdgeInsets.zero, // Remove default content padding
              ),
              items: ['Monthly', 'Weekly']
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle change
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return Expanded(
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: jewelCart,
            onChanged: (String? newValue) {
              setState(() {
                jewelCart = newValue!;
              });
            },
            activeColor: Colors.amber,
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildFileUploadSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Handle file upload logic here
            },
            child: Text(
              'Choose File',
              style: TextStyle(color: Colors.amber[700]),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Note: Only Images JPG, JPEG, PNG are allowed.\nImages should be less than 20 MB.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),

          // Uploaded Image Preview Section
          Row(
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('File name 1',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('File size 1.2 MB',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.red),
                onPressed: () {
                  // Handle delete file functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
