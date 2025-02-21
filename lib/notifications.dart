import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  // Fetch notifications from Firestore (last 15 days)
  Stream<QuerySnapshot> fetchNotifications() {
    DateTime fifteenDaysAgo = DateTime.now().subtract(const Duration(days: 15));
    return FirebaseFirestore.instance
        .collection('notifications') // Firestore collection name
        .where('timestamp', isGreaterThanOrEqualTo: fifteenDaysAgo) // Last 15 days filter
        .orderBy('timestamp', descending: true) // Newest notifications first
        .snapshots();
  }

  // Open image in browser when clicked
  Future<void> _openImage(String imageUrl) async {
    final Uri uri = Uri.parse(imageUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open image URL: $imageUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c7147),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fetchNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading notifications'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No notifications in the last 15 days'));
          }

          var notifications = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              var notification = notifications[index];

              // ✅ Safely cast Firestore data to a Map
              Map<String, dynamic> data = notification.data() as Map<String, dynamic>;

              String title = data['title'] ?? 'No Title';
              String body = data['body'] ?? 'No Body';
              Timestamp timestamp = data['timestamp'];
              String? imageUrl = data.containsKey('imageUrl') ? data['imageUrl'] : null;

              String formattedDate = DateFormat('MMM d, yyyy - hh:mm a')
                  .format(timestamp.toDate());

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date & Time
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Notification Title
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Notification Body
                      Text(
                        body,
                        style: const TextStyle(fontSize: 16),
                      ),
                      if (imageUrl != null) ...[
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _openImage(imageUrl),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              imageUrl,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text(
                                  'Image failed to load',
                                  style: TextStyle(color: Colors.red),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
