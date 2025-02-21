import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticePanelPage extends StatefulWidget {
  const NoticePanelPage({Key? key}) : super(key: key);

  @override
  State<NoticePanelPage> createState() => _NoticePanelPageState();
}

class _NoticePanelPageState extends State<NoticePanelPage> {
  List<String> updatedNotices = [];
  List<String> classNotices = [];

  // Function to fetch data from Firestore
  Future<void> fetchNotices() async {
    try {
      // Fetch updated notices
      final updatedSnapshot = await FirebaseFirestore.instance
          .collection('updated_notices')
          .doc('n0Mc70lPRbvatPuao2lt') // Your actual document ID
          .get();

      final updatedData = updatedSnapshot.data();
      if (updatedData != null && updatedData['notices'] is List) {
        setState(() {
          updatedNotices = List<String>.from(updatedData['notices']);
        });
      }

      // Fetch class notices
      final classSnapshot = await FirebaseFirestore.instance
          .collection('class_notices')
          .doc('4LxqfNohlumGeIzto3WH') // Replace with your actual document ID
          .get();

      final classData = classSnapshot.data();
      if (classData != null && classData['notices'] is List) {
        setState(() {
          classNotices = List<String>.from(classData['notices']);
        });
      }
    } catch (e) {
      print('Error fetching notices: $e');
    }
  }


  @override
  void initState() {
    super.initState();
    fetchNotices(); // Fetch notices when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c7147),
        title: const Text(
          'Notice Panel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // Updated Notice Section
            SectionHeader(title: "University Notices"),
            NoticesList(notices: updatedNotices),
            const SizedBox(height: 20),

            // Class Notice Section
            SectionHeader(title: "Class Notices"),
            NoticesList(notices: classNotices),
          ],
        ),
      ),
    );
  }
}

// Widget for section headers
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1c7147),
        ),
      ),
    );
  }
}

// Widget for displaying a list of notices
class NoticesList extends StatelessWidget {
  final List<String> notices;

  const NoticesList({Key? key, required this.notices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notices.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFF1c7147)),
            title: Text(
              notices[index],
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
