import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ReferenceLinks());
}

class ReferenceLinks extends StatelessWidget {
  const ReferenceLinks({super.key});

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
          'Reference Links',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1c7147),
      ),
      body: const Reference(),
    );
  }
}

class Reference extends StatelessWidget {
  const Reference({super.key});

  Future<void> _redirectToLink(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Discover Essential Resources to Support',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          Center(
            child: Text(
              'Your Academic Journey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 40),
          buildLinkContainer(
            context,
            "BAIUST WEBSITE",
            "https://baiust.ac.bd/",
            Icons.language,
          ),
          const SizedBox(height: 40),
          buildLinkContainer(
            context,
            "CSE SOCIETY FB GROUP",
            "https://www.facebook.com/groups/1833203236893680",
            Icons.group,
          ),
          const SizedBox(height: 40),
          buildLinkContainer(
            context,
            "BAIUST COMPUTER CLUB",
            "https://www.facebook.com/baiustcomputerclub",
            Icons.computer,
          ),
          const SizedBox(height: 40),
          buildLinkContainer(
            context,
            "Competitive Programming",
            "https://www.facebook.com/groups/866198671070989",
            Icons.code,
          ),
        ],
      ),
    );
  }

  // Method to create each clickable container
  Widget buildLinkContainer(
      BuildContext context,
      String text,
      String url,
      IconData icon,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey.shade300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _redirectToLink(context, url),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF1c7147), size: 40), // Custom icon
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Icon(Icons.arrow_forward, color: Color(0xFF1c7147)),
            ],
          ),
        ),
      ),
    );
  }
}
