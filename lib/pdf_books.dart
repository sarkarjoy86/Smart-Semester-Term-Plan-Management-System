import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PdfBooks(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PdfBooks extends StatelessWidget {
  const PdfBooks({super.key});

  // Function to launch URL
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
          'PDFs',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Major Course Section
            const Text(
              "Major Course",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/file/d/1tYZRYLt7mCCLV1U6NAdOUad5T7HRGhdf/view?usp=drive_link"),
                    child: courseBox("Level 1 Term 1"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/link2"),
                    child: courseBox("Level 1 Term 2"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/link3"),
                    child: courseBox("Level 2 Term 1"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/link4"),
                    child: courseBox("Level 2 Term 2"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/drive/folders/1Tu_bLON3IsGKNtNYfmyv0wEvcdrSsUby?usp=sharing"),
                    child: courseBox("Level 3 Term 1"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/link6"),
                    child: courseBox("Level 3 Term 2"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/link7"),
                    child: courseBox("Level 4 Term 1"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/link8"),
                    child: courseBox("Level 4 Term 2"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Non-Major Course Section
            const Text(
              "Non-Major Course",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/math"),
                    child: courseBox("Math"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/physics"),
                    child: courseBox("Physics"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/english"),
                    child: courseBox("English"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/chemistry"),
                    child: courseBox("Chemistry"),
                  ),
                  InkWell(
                    onTap: () => _redirectToLink("https://drive.google.com/chemistry"),
                    child: courseBox("GED"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a course box
  Widget courseBox(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 150,
      height: 70,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
