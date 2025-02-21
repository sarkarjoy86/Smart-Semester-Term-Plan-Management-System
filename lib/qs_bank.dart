import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const QSBank());
}

class QSBank extends StatelessWidget {
  const QSBank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeActivity(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  Future<void> _redirectToLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Question Bank',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1c7147),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Explore the different levels and terms to access relevant materials for your academic success.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],  // Grey color for the header text
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            _buildRow(context, "L:1/T:1", "https://example.com/l1t1", "L:1/T:2", "https://example.com/l1t2"),
            const SizedBox(height: 40),
            _buildRow(context, "L:2/T:1", "https://example.com/l2t1", "L:2/T:2", "https://example.com/l2t2"),
            const SizedBox(height: 40),
            _buildRow(context, "L:3/T:1", "https://drive.google.com/drive/folders/1bD9_AHmvtncr2yBbs5i8AhtPH5-INnPM?usp=sharing", "L:3/T:2", "https://example.com/l3t2"),
            const SizedBox(height: 40),
            _buildRow(context, "L:4/T:1", "https://example.com/l4t1", "L:4/T:2", "https://example.com/l4t2"),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label1, String url1, String label2, String url2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContainer(context, label1, url1),
        _buildContainer(context, label2, url2),
      ],
    );
  }

  Widget _buildContainer(BuildContext context, String label, String url) {
    // Using the 'drive_file_move' icon
    IconData icon = Icons.drive_file_move;

    return InkWell(
      onTap: () => _redirectToLink(url),
      child: Container(
        height: 120,  // Slightly larger container height
        width: 120,   // Slightly larger container width
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.yellow[50],  // Slight yellow background
          borderRadius: BorderRadius.circular(12.0),  // Rounded corners
          border: Border.all(color: Colors.green[900]!, width: 1),  // Thinner green border with shade900
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 0),  // Shadow offset to create a popup effect
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green[900], size: 50),  // Drive file move icon
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.green[900]),  // Dark green font color with shade900
            ),
          ],
        ),
      ),
    );
  }
}
