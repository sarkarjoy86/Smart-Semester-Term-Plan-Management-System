import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
            const SizedBox(height: 45),
            // Header
            const Center(
              child: Column(
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Meet the Developers",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Ensuring scrolling behavior for smaller screens
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      const Text(
                        "Our Team",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildTeamMember(
                        "Joy Sarkar",
                        "Developer & Team Leader",
                        "https://res.cloudinary.com/da09xtkav/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1738259486/Screenshot_885_cq2f8k.png",
                      ),
                      buildTeamMember(
                        "Farzana Akter Anamika",
                        "Designer & Developer",
                        "https://res.cloudinary.com/da09xtkav/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1738525153/Anamika_sgways.jpg",
                      ),
                      buildTeamMember(
                        "Shawon Roy",
                        "Developer & Tester",
                        "https://res.cloudinary.com/da09xtkav/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1738259486/Screenshot_886_z24hcm.png",
                      ),
                      const SizedBox(height: 00),
                      const Text(
                        "We are a passionate team dedicated to making academic tools smarter and more user-friendly.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
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
    );
  }

  Widget buildTeamMember(String name, String role, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl), // Loads profile picture from URL
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
