import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smartsemester/pdf_books.dart';
import 'package:smartsemester/profilePage.dart';
import 'package:smartsemester/settings_page.dart';
import 'courses.dart';
import 'notifications.dart';
import 'reference_links.dart';
import 'qs_bank.dart';
import 'notice_pannel.dart';
import 'teachers_info.dart';
import 'LoginPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> images = [
  'images/Slides/Routine.jpg',
  'images/Slides/BusSchedule.jpg',
  'images/Slides/AC.jpg',
];

class _HomePageState extends State<HomePage> {
  bool _isFabMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show the snack bar message to prevent the back action
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please log out to Exit the Application'),
          ),
        );
        return false; // Prevents back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1c7147),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Use context from Builder
                },
                icon: const Icon(Icons.menu, size: 30),
                color: Colors.white,
              );
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/1.png', // Replace with your image path
                height: 60,
                width: 60, // Adjust the size of the logo
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              icon: const Icon(Icons.settings, size: 30),
              color: Colors.white,
            ),
          ],
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6, // Set width to 60% of the screen width
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF1c7147),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.account_circle, size: 80, color: Colors.white),
                      const SizedBox(height: 10),
                      const Text('Welcome, Joy', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                // Newly added buttons placed between Profile and Settings
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('IUMSS'),
                  onTap: () {
                    _launchURL('https://iumss.baiust.ac.bd/');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Academic Calendar'),
                  onTap: () {
                    _launchURL('https://drive.google.com/file/d/1MBQmV-Kgf0CB1t6C9Dr4QHTFTgd66umX/view?usp=sharing');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Prospectus'),
                  onTap: () {
                    _launchURL('https://drive.google.com/file/d/15pU1_JXyiKuxlYkukLv8bwGzSplvPm0i/view?usp=sharing');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Log Out'),
                  onTap: () {
                    // Show a confirmation dialog when "Log Out" is tapped
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Are you sure?"),
                          content: const Text("Do you really want to log out?"),
                          actions: <Widget>[
                            // "No" button - Close the dialog and go to Home page
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
                                );
                              },
                              child: const Text("No"),
                            ),
                            // "Yes" button - Proceed with log out
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()), // Log out and navigate to LoginPage
                                );
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

              ],
            ),
          )

        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1c7147),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: -90,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 9,
                        right: -60,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(1),
                            child: Text(
                              "Smart Semester",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search here...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCategoryButton(
                            'images/icons/teacher.png',
                            'Faculty Members',
                            const FacultyPage(),
                          ),
                          _buildCategoryButton(
                            'images/icons/notice.png',
                            'Notice Panel',
                            const NoticePanelPage(),
                          ),
                          _buildCategoryButton(
                            'images/icons/course.png',
                            'Courses',
                            const CoursePage(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCategoryButton(
                            'images/icons/qs.png',
                            'QS Bank',
                            QSBank(),
                          ),
                          _buildCategoryButton(
                            'images/icons/pdf.png',
                            'PDF Books',
                            PdfBooks(),
                          ),
                          _buildCategoryButton(
                            'images/icons/link.png',
                            'Reference Links',
                            ReferenceLinks(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          aspectRatio: 9 / 16,
                          enableInfiniteScroll: true,
                        ),
                        items: images.map((imagePath) {
                          return _buildCarouselItem(imagePath, context); // Pass context explicitly
                        }).toList(),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ],
            ),
            _buildFloatingMenu(context), // Show the additional buttons when FAB is clicked
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            setState(() {
              _isFabMenuOpen = !_isFabMenuOpen; // Toggle the visibility of the menu
            });
          },
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF1c7147),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF1c7147),
          notchMargin: 6,
          shape: const CircularNotchedRectangle(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavIcon(Icons.home, 'Home', null),
                _buildBottomNavIcon(Icons.assignment, 'Courses', const CoursePage()),
                const SizedBox(width: 40),
                _buildBottomNavIcon(Icons.notifications, 'Notifications', const NotificationPage()),
                _buildBottomNavIcon(Icons.account_circle, 'Profile', ProfilePage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String iconPath, String label, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        height: 120,
        width: 120,
        child: Column(
          children: [
            Image.asset(iconPath, height: 70, width: 70),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true, // Allows closing when tapped outside
          builder: (_) => Stack(
            children: [
              // Blurred Background
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.5), // Semi-transparent effect
                  ),
                ),
              ),
              // Image Dialog
              Center(
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: PhotoView(
                      imageProvider: AssetImage(imagePath),
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent, // Keeps background blur visible
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildBottomNavIcon(IconData icon, String label, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 29),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildFloatingMenu(BuildContext context) {
    return Positioned(
      bottom: 50,  // Position the menu above the FAB
      left: MediaQuery.of(context).size.width / 2 - 120,  // Center the text box horizontally
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Main "+" button
          // Removed "+" button, keeping only the text box

          // Commenting out the three buttons
          /*
        if (_isFabMenuOpen)
          Container(
            width: 180,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                _launchURL('https://iumss.baiust.ac.bd/');
              },
              backgroundColor: Color(0xFF1c7147),
              mini: false,
              child: const Text(
                'IUMSS',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        const SizedBox(height: 10),
        if (_isFabMenuOpen)
          Container(
            width: 180,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                _launchURL('https://drive.google.com/file/d/1MBQmV-Kgf0CB1t6C9Dr4QHTFTgd66umX/view?usp=sharing');
              },
              backgroundColor: Color(0xFF1c7147),
              mini: false,
              child: const Text(
                'Academic Calendar',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        const SizedBox(height: 10),
        if (_isFabMenuOpen)
          Container(
            width: 180,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                _launchURL('https://drive.google.com/file/d/15pU1_JXyiKuxlYkukLv8bwGzSplvPm0i/view?usp=sharing');
              },
              backgroundColor: Color(0xFF1c7147),
              mini: false,
              child: const Text(
                'Prospectus',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        */

          // Centered text box with white background and green border
          if (_isFabMenuOpen)
            Container(
              width: 240,  // Increased width
              height: 100,  // Increased height
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Uhh! Guess You are not an Admin.\n Sorry, Dude this Button is Only for Admins",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),  // Font color set to black
                ),
              ),
            ),
        ],
      ),
    );
  }





  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
