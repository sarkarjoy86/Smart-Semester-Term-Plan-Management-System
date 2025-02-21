import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const CoursePage());
}

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'name': 'Operating System',
        'code': 'CSE 311',
        'credit': '3.0',
        'driveLink': 'https://drive.google.com/drive/folders/1nd4d_xhdOFhuP5vv8WaZRA-Ouv-gr1Ed?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/',
        'whatsappLink': 'https://chat.whatsapp.com/H6nBYyHSSja1tfBjBK5g5l',
        'teacherName': 'Mohammad Asaduzzaman Khan',
        'teacherTitle': 'Associate Professor & Acting Dean, Faculty of ECE',
        'teacherEmail': 'mak@baiust.ac.bd',
        'teacherPhone': '01711003233',
      },
      {
        'name': 'Database Management System',
        'code': 'CSE 313',
        'credit': '3.0',
        'driveLink': 'https://drive.google.com/drive/folders/1vbx98yQt6NspOrVAN970ujQvYlBIwyHW?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/1/c/NzI0MDgyMjc1NjY4',
        'whatsappLink': 'https://chat.whatsapp.com/HhmZdWUfw4g9CeFlfa7Bzp',
        'teacherName': 'Md. Abdullah',
        'teacherTitle': 'Lecturer, Faculty of CSE',
        'teacherEmail': 'mabdullah.cse@baiust.ac.bd',
        'teacherPhone': '01728985125',
      },
      {
        'name': '	Computer Architecture and Design',
        'code': 'CSE 315',
        'credit': '3.0',
        'driveLink': 'https://drive.google.com/drive/folders/1aWkWWu4i8DVR-sTe3ZGKcOdG1YtUIssM?usp=sharing',
        'classroomLink': 'https://classroom.google.com/cad',
        'whatsappLink': 'https://chat.whatsapp.com/I8JYiSU2Q4k30cxrZk12L6',
        'teacherName': 'Golam Moktader Nayeem',
        'teacherTitle': 'Associate Professor & Head of the Department, Faculty of CSE',
        'teacherEmail': 'gmnayeem.cse@baiust.ac.bd',
        'teacherPhone': '01717293250',
      },
      {
        'name': 'Software Engineering and Design Patterns',
        'code': 'CSE 317',
        'credit': '3.0',
        'driveLink': 'https://drive.google.com/drive/folders/1mk_P5CpvqpiUTkm_BrDzrs_OZlLcxVpT?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/1/c/NzI3NjQ5ODg5NTgx',
        'whatsappLink': 'https://chat.whatsapp.com/I0nMHhOIGl00dnRrrN3KkO',
        'teacherName': 'Most. Fatematuz Zohora',
        'teacherTitle': 'Lecturer, Faculty of CSE',
        'teacherEmail': 'zohora.cse@baiust.ac.bd',
        'teacherPhone': '01767833962',
      },
      {
        'name': 'Theory of Computation',
        'code': 'CSE 319',
        'credit': '3.0',
        'driveLink': 'https://drive.google.com/drive/folders/1uxFSF9i1l8PRkh13Hol5wtcCEM8xklwG?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/1/c/NzE1OTg2OTM5Njk0',
        'whatsappLink': 'https://chat.whatsapp.com/DYuCubFMt0e26Zfw5x244r',
        'teacherName': 'Md. Saad Bin Kamal',
        'teacherTitle': 'Lecturer, Faculty of CSE',
        'teacherEmail': 'saad.cse@baiust.ac.bd',
        'teacherPhone': '01788694804',
      },
      {
        'name': 'Engineering Drawing',
        'code': 'CE 311',
        'credit': '1.0',
        'driveLink': 'https://drive.google.com/drive/folders/1QEY_TdxR83FZ7KFns-OERoMIE8yir7It?usp=sharing',
        'classroomLink': '',
        'whatsappLink': 'https://chat.whatsapp.com/ByeMVQDZmKI14rbXcYDxEa',
        'teacherName': 'Arman Hossain Patwary',
        'teacherTitle': 'Lecturer, Faculty of CE',
        'teacherEmail': 'arman.ce@baiust.ac.bd',
        'teacherPhone': '01869534827',
      },
    ];

    final List<Map<String, String>> labs = [
      {
        'name': 'Operating System Sessional',
        'code': 'CSE 312',
        'credit': '1.0',
        'driveLink': 'https://drive.google.com/drive/folders/1Si7OO4kXMWyfhTgfQkXDkiBRTVef386c?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/1/c/NzE0OTExOTkyMDEw',
        'whatsappLink': 'https://chat.whatsapp.com/HhmZdWUfw4g9CeFlfa7Bzp',
        'teacherName': 'Md. Abdullah',
        'teacherTitle': 'Lecturer, Faculty of CSE',
        'teacherEmail': 'mabdullah.cse@baiust.ac.bd',
        'teacherPhone': '01728985125',
      },
      {
        'name': 'Database Management System Sessional',
        'code': 'CSE 314',
        'credit': '1.5',
        'driveLink': 'https://drive.google.com/drive/folders/1hW6YUvq6znqiUXjG1GIUOIpJY1AamYuL?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/1/c/NzE0OTEwMjkwODk3',
        'whatsappLink': 'https://chat.whatsapp.com/HhmZdWUfw4g9CeFlfa7Bzp',
        'teacherName': 'Md. Abdullah',
        'teacherTitle': 'Lecturer, Faculty of CSE',
        'teacherEmail': 'mabdullah.cse@baiust.ac.bd',
        'teacherPhone': '01728985125',
      },
      {
        'name': 'Software Engineering Sessional',
        'code': 'CSE 318',
        'credit': '1.0',
        'driveLink': 'https://drive.google.com/drive/folders/1MaIXRYoK0_su4bY0M226gZrHDPLyHM-y?usp=sharing',
        'classroomLink': 'https://classroom.google.com/u/1/c/NzI3NjQ5ODg5NTgx',
        'whatsappLink': 'https://chat.whatsapp.com/I0nMHhOIGl00dnRrrN3KkO',
        'teacherName': 'Most. Fatematuz Zohora',
        'teacherTitle': 'Lecturer, Faculty of CSE',
        'teacherEmail': 'zohora.cse@baiust.ac.bd',
        'teacherPhone': '01767833962',
      },
      {
        'name': 'Engineering Drawing and CAD Sessional',
        'code': 'CE 312',
        'credit': '1.0',
        'driveLink': 'https://drive.google.com/drive/folders/19g5qCb1OhhFJ2P3UPJ2PUn7MbDhh0v2P?usp=sharing',
        'classroomLink': '',
        'whatsappLink': 'https://chat.whatsapp.com/ByeMVQDZmKI14rbXcYDxEa',
        'teacherName': 'Arman Hossain Patwary',
        'teacherTitle': 'Lecturer, Faculty of CE',
        'teacherEmail': 'arman.ce@baiust.ac.bd',
        'teacherPhone': '01869534827',
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'L: 3 & T: I',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1c7147),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SectionHeader(title: 'Courses'),
            ...courses.map((course) => CourseLabCard(
              name: course['name']!,
              code: course['code']!,
              credit: course['credit']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailPage(course: course),
                  ),
                );
              },
            )),
            const SectionHeader(title: 'Labs'),
            ...labs.map((lab) => CourseLabCard(
              name: lab['name']!,
              code: lab['code']!,
              credit: lab['credit']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailPage(course: lab),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class CourseLabCard extends StatelessWidget {
  final String name;
  final String code;
  final String credit;
  final VoidCallback onTap;

  const CourseLabCard({
    Key? key,
    required this.name,
    required this.code,
    required this.credit,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(Icons.book, color: Color(0xFF1c7147), size: 40),
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
                    Text('Code: $code'),
                    const SizedBox(height: 4.0),
                    Text('Credit: $credit'),
                  ],
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

class CourseDetailPage extends StatelessWidget {
  final Map<String, String> course;

  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  Future<void> _redirectToLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch phone call');
    }
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard: $text'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c7147),
        title: Text(
          course['name']!,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course['name']!,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text('Code: ${course['code']}'),
            const SizedBox(height: 8.0),
            Text('Credit: ${course['credit']}'),
            const SizedBox(height: 32.0),
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _redirectToLink(course['driveLink']!),
                    icon: const Icon(Icons.drive_file_move),
                    label: const Text('Google Drive'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton.icon(
                    onPressed: () => _redirectToLink(course['classroomLink']!),
                    icon: const Icon(Icons.class_),
                    label: const Text('Google Classroom'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton.icon(
                    onPressed: () => _redirectToLink(course['whatsappLink']!),
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    label: const Text('WhatsApp Group'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Faculty Details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['teacherName']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      course['teacherTitle']!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () =>
                          _copyToClipboard(context, course['teacherEmail']!),
                      child: Row(
                        children: [
                          const Icon(Icons.email, color: Colors.blue),
                          const SizedBox(width: 8.0),
                          Text(
                            course['teacherEmail']!,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () =>
                          _copyToClipboard(context, course['teacherPhone']!),
                      child: Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.green),
                          const SizedBox(width: 8.0),
                          Text(
                            course['teacherPhone']!,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton.icon(
                      onPressed: () => _makePhoneCall(course['teacherPhone']!),
                      icon: const Icon(Icons.phone, color: Colors.white),
                      label: const Text('Call'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
