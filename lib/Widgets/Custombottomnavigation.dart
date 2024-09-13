import 'package:bitgold/User/seacrh_user.dart';
import 'package:flutter/material.dart';
import '../Home/Home.dart';
import '../Tracker/tracker_main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        // Navigate to Home
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage()), // Replace with your Home widget
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SearchUserScreen()), // Replace with your Add User widget
        );
        break;
      case 2:
        // Navigate to Tracker
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TrackerMainScreen()), // Replace with your Tracker widget
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 248, 249, 252),
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index); // Trigger the onTap event for parent widget
        _navigateToPage(index, context); // Perform navigation based on index
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add),
          label: 'User',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.track_changes),
          label: 'Tracker',
        ),
      ],
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
    );
  }
}
