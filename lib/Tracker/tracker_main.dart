import 'package:flutter/material.dart';
import 'package:bitgold/Home/Home.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bitgold/Tracker/track_details.dart';
import 'package:bitgold/Custombottomnavigation.dart';

class TrackerMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        surfaceTintColor: Colors.white,
        title: Text('Tracker'),
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
              // Handle settings action
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Rate Section

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRateCard('Gold Rate', '₹48,400.00', '22KT/gram',
                            '+200.20', Color(0xFF15B097)),
                        _buildRateCard('Silver Rate', '₹24,400.50', '22KT/gram',
                            '-400.20', Color(0XFFC03744)),
                      ],
                    ),
                  ),

                  // Chart Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200, // Fixed height for chart area
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: 2500,
                              barTouchData: BarTouchData(
                                enabled: true,
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipPadding: EdgeInsets.all(6),
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                    return BarTooltipItem(
                                      rod.toY.round().toString(),
                                      TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      const style = TextStyle(
                                        color: Color(0xFF6D6D6D),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      );
                                      Widget text;
                                      switch (value.toInt()) {
                                        case 0:
                                          text = Text('Loans', style: style);
                                          break;
                                        case 1:
                                          text = Text('Overdue', style: style);
                                          break;
                                        case 2:
                                          text = Text('Partial', style: style);
                                          break;
                                        default:
                                          text = Text('', style: style);
                                          break;
                                      }
                                      return SideTitleWidget(
                                        axisSide: meta.axisSide,
                                        space:
                                            6, // Adjusts the space between the title and the axis line
                                        child: text,
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles:
                                        false, // Hides the Y-axis titles (0, 1k, 2.5k)
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: false), // Hides top titles
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: false), // Hides right titles
                                ),
                              ),
                              gridData: FlGridData(
                                show: true, // Show the grid lines
                                drawVerticalLine:
                                    false, // Disable vertical lines
                                horizontalInterval:
                                    1000, // Set the interval between the horizontal lines
                                getDrawingHorizontalLine: (value) {
                                  // Only draw lines at specified y-values
                                  if (value == 1000 || value == 2000) {
                                    return FlLine(
                                      color: const Color.fromARGB(
                                          97, 158, 158, 158),
                                      strokeWidth: 1,
                                      dashArray: [
                                        10,
                                        10
                                      ], // Creates dotted line
                                    );
                                  }
                                  return FlLine(
                                    color: Colors
                                        .transparent, // Makes other lines invisible
                                  );
                                },
                              ),
                              borderData: FlBorderData(
                                show: false, // Hides the chart border
                              ),
                              barGroups: [
                                BarChartGroupData(
                                  x: 0,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 1800,
                                      color: Color(0xFFF3E5AB),
                                      borderRadius: BorderRadius.circular(6),
                                      width: 30,
                                    ),
                                  ],
                                  showingTooltipIndicators: [0],
                                ),
                                BarChartGroupData(
                                  x: 1,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 2300,
                                      color: Color(0xFFD4AF37),
                                      borderRadius: BorderRadius.circular(6),
                                      width: 30,
                                    ),
                                  ],
                                  showingTooltipIndicators: [0],
                                ),
                                BarChartGroupData(
                                  x: 2,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 800,
                                      color: Color(0xFFF3E5AB),
                                      borderRadius: BorderRadius.circular(6),
                                      width: 30,
                                    ),
                                  ],
                                  showingTooltipIndicators: [0],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DraggableBottomSheet(
              barrierColor: Colors.white,
              minExtent: 300,
              useSafeArea: false,
              curve: Curves.easeIn,
              maxExtent: MediaQuery.of(context).size.height * 0.81,

              backgroundWidget: Container(
                color: Colors.white,
              ),
              previewWidget:
                  _buildTransactionContainer(3), // Show 3 items in preview
              expandedWidget: _buildTransactionContainer(
                  10), // Show 10 items in expanded state
              onDragging: (dragValue) {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onTap: (index) {
            // Handle navigation bar item taps
            switch (index) {}
          }),
    );
  }

  Widget _buildRateCard(
      String title, String rate, String subtitle, String change, Color color) {
    return Container(
      height: 65, // Adjusted height for visual similarity
      width: 175, // Adjusted width for visual similarity
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8), // Slightly smaller border radius
        ),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 4.0, vertical: 4.0), // Reduced padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circle with Icon
              CircleAvatar(
                backgroundColor: Colors.amber, // Background color of the circle
                radius: 14, // Reduced size of the circle
                child: Icon(Icons.star,
                    color: Colors.white, size: 20), // Smaller icon size
              ),
              SizedBox(width: 4), // Reduced space between avatar and text
              // Text Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.5, // Reduced font size
                          ),
                        ),
                        // Rate
                        Text(
                          rate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.5, // Reduced font size
                          ),
                        ),
                      ],
                    ),
                    // Subtitle and Change in a new row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Subtitle
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 10.5,
                            color:
                                Colors.grey, // Smaller font size for subtitle
                          ),
                        ),
                        // Change
                        Text(
                          change,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.5, // Reduced font size
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionContainer(int itemCount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 36, // Adjusted height for the search box
                  width: 120, // Reduced width for the search box
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the box
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Subtle shadow
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey[300]!, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey[500], // Search icon color
                        size: 20, // Adjust the icon size
                      ),
                      SizedBox(
                          width:
                              6), // Adjust the space between the icon and text
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14, // Text size
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return _buildTransactionCard(
                    'Saravanan S',
                    index.isEven ? '₹43,000.00' : '₹50,000.00',
                    index.isEven ? 'Payment Done' : 'Payment Overdue',
                    index.isEven ? Colors.green : Colors.red,
                    '2 months',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZQ-58A9-OeR5XnI472drONTCTHxcpWhCtAoVCSluGAoFn89Vp', // Replace with actual profile image URL
                    index.isEven ? Icons.check_circle : Icons.warning,
                    context // Use different icons for different statuses
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(
    String name,
    String amount,
    String status,
    Color statusColor,
    String time,
    String imageUrl,
    IconData statusIcon,
    BuildContext context, // Add the BuildContext parameter
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TrackDetailScreen()), // Navigate to TrackDetails
          );
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.grey[300]!,
              width: 1.0,
            ),
          ),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 35,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            statusIcon,
                            color: statusColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
