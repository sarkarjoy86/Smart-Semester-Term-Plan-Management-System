import 'package:flutter/material.dart';
import 'update_profile.dart';
import 'security_settings.dart';
import 'help_and_support.dart';
import 'about_us.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF1c7147),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            const Center(
              child: Column(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Configure your settings",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.dark_mode),
                              title: const Text("Dark Mode"),
                              trailing: Switch(
                                value: _darkMode,
                                onChanged: (value) {
                                  setState(() {
                                    _darkMode = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.notifications),
                              title: const Text("Notifications"),
                              trailing: Switch(
                                value: _notificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    _notificationsEnabled = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.account_circle),
                              title: const Text("Update Profile"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const UpdateProfilePage()),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.security),
                              title: const Text("Security Settings"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SecuritySettingsPage()),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.help),
                              title: const Text("Help & Support"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HelpAndSupportPage()),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.info),
                              title: const Text("About Us"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF1c7147),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1c7147),
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          height: 60, // Fixed height (previously it was 0)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white, size: 29),
                  Text('Home', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings, color: Colors.white, size: 29),
                  Text('Settings', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
