import 'package:flutter/material.dart';
import 'package:egroce/widgets/appbar.dart';
import 'package:egroce/widgets/navbar.dart';
import 'categories.dart';
import 'home.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'About Us',
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Our Mission'),
            _buildMissionText(),
            const SizedBox(height: 20),
            _buildSectionTitle('Company History'),
            _buildHistoryText(),
            const SizedBox(height: 20),
            _buildSectionTitle('Contact Information'),
            _buildContactInfo(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Categories()),
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMissionText() {
    return Text(
      'At E-Groce, our mission is to revolutionize the way people shop for groceries online. '
          ' We strive to provide fresh, high-quality products at competitive prices,'
          ' ensuring that our customers can easily access the essentials they need. '
        ' Our goal is to make grocery shopping convenient, efficient, and enjoyable, '
        'saving our customers time and effort while delivering exceptional value. '
      'We are committed to building long-lasting relationships with our customers,'
      ' suppliers, and partners, driven by a shared passion for excellence and innovation.',


      style: const TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildHistoryText() {
    return Text(
      'Since its inception, E-Groce has been committed to redefining the online grocery shopping experience.  '
          'From humble beginnings, we have grown into a trusted name in the e-grocery industry, '
          ' driven by our dedication to innovation and customer satisfaction. Over the years, '
          'we have continuously expanded our product range, improved our services, and embraced technological advancements '
      'to better serve our customers. Our journey has been marked by milestones and achievements,'
      ' each contributing to our mission of making grocery shopping more convenient and accessible for everyone.',
      style: const TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address: 502 Block A, Bahria EMC Lahore Pakistan',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Phone: (+92)3114443813',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Email: info@egroce.com',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
