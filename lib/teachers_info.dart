import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FacultyPage());
}

class FacultyPage extends StatelessWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Faculty Members",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1c7147),
        ),
        body: const FacultyList(),
      ),
    );
  }
}

class FacultyList extends StatelessWidget {
  const FacultyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch data from Firestore
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('faculty_members').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading faculty members'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No faculty members found'));
        }

        final facultyDocs = snapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: facultyDocs.length,
          itemBuilder: (context, index) {
            final data = facultyDocs[index].data() as Map<String, dynamic>;

            return FacultyCard(
              name: data['name'] ?? 'N/A',
              position: data['position'] ?? 'N/A',
              email: data['email'] ?? 'N/A',
              phone: data['phone'] ?? 'N/A',
              imageUrl: data['imageUrl'] ?? '', // Cloudinary URL
              website: data['website'] ?? '', // Faculty website
            );
          },
        );
      },
    );
  }
}

class FacultyCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phone;
  final String imageUrl;
  final String website;

  const FacultyCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.website,
  });

  void _launchURL(String url) async {
    if (url.isEmpty) {
      print("URL is empty");
      return;
    }

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  void _copyToClipboard(String value, BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$value copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(imageUrl),
              onBackgroundImageError: (exception, stackTrace) =>
              const Icon(Icons.error),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    position,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 16.0,
                        color: Colors.red.shade900, // Darkest red for the email icon
                      ),
                      const SizedBox(width: 4.0),
                      GestureDetector(
                        onTap: () => _copyToClipboard(email, context),
                        child: Text(
                          email,
                          style: TextStyle(
                            color: Colors.red.shade900, // Darkest red for the email text
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 16.0,
                        color: Colors.green.shade900, // Darkest green for phone icon
                      ),
                      const SizedBox(width: 4.0),
                      GestureDetector(
                        onTap: () => _copyToClipboard(phone, context),
                        child: Text(
                          phone,
                          style: TextStyle(
                            color: Colors.green.shade900, // Darkest green for the phone number
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () => _launchURL(website),
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: 16.0,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4.0),
                        const Text(
                          'Visit Website for More Details',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
