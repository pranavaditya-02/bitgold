import 'package:flutter/material.dart';
import 'package:bitgold/Custombottomnavigation.dart';

class SearchUserScreen extends StatefulWidget {
  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  bool isSearched = false; // State to control when the user has searched
  List<String> users = []; // Placeholder for user data after search

  void searchUsers() {
    setState(() {
      isSearched = true;
      users = ['Kumar s', 'Kumar s']; // Replace this with your search logic
    });
  }

  void createUser() {
    // Navigate to create user screen
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         CreateUserScreen(), // Replace with your actual create user screen
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Search User",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              // Handle settings button
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSearched) // Show image only before search
                    Center(
                      child: Image.asset(
                        'assets/pana.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Search existing user or Create new",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      hoverColor: Color(0xB6C3CD),
                      focusColor: Color(0xB6C3CD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Mobile Number",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 30),
                  // Conditionally change button text based on search state
                  ElevatedButton(
                    onPressed: isSearched ? createUser : searchUsers,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 146, 165, 181),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      isSearched ? "Create New User" : "Search",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSearched)
            DraggableScrollableSheet(
              initialChildSize: 0.3, // Initial height of the sheet
              minChildSize: 0.1, // Minimum height when collapsed
              maxChildSize: 0.7, // Maximum height when expanded
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey[300]!, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "User you may search",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller:
                              scrollController, // Attach scrollController
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp'), // Replace with actual image
                              ),
                              title: Text(users[index]),
                              subtitle: Text("0000869"), // Placeholder data
                              trailing: TextButton(
                                onPressed: () {
                                  // Navigate to user's details or perform action
                                },
                                child: Text("View"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation bar item taps
        },
      ),
    );
  }
}

// Placeholder for the CreateUserScreen
