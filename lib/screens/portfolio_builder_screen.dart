import 'package:flutter/material.dart';
import '../portfolio_data.dart';
import 'about_screen.dart';
import 'skills_screen.dart';
import 'contact_screen.dart';
import 'portfolio_preview_screen.dart';

class PortfolioBuilderScreen extends StatelessWidget {
  final PortfolioData data;

  const PortfolioBuilderScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 35),
          children: [
            // Top Bar
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF25232A),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Build Portfolio',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25232A),
                    ),
                  ),
                ),
                const Text(
                  '01/03',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6750A4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 45),

            // Main Heading
            const Text(
              'Let’s create\nyour profile.',
              style: TextStyle(
                fontSize: 38,
                height: 1.08,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25232A),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Complete these three sections to build '
              'your personal portfolio.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF77727F),
              ),
            ),

            const SizedBox(height: 45),

            // Step 01
            _buildStep(
              number: '01',
              title: 'ABOUT',
              description: 'Tell us about yourself',
              icon: Icons.person_outline_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutScreen(data: data),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Step 02
            _buildStep(
              number: '02',
              title: 'SKILLS',
              description: 'What can you do?',
              icon: Icons.code_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SkillsScreen(data: data),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Step 03
            _buildStep(
              number: '03',
              title: 'CONTACT',
              description: 'How can people reach you?',
              icon: Icons.mail_outline_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactScreen(data: data),
                  ),
                );
              },
            ),

            const SizedBox(height: 45),

            // Progress
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6750A4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCD7E5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCD7E5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const Text(
              '3 sections to complete',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF918C99),
              ),
            ),

            const SizedBox(height: 25),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 57,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PortfolioPreviewScreen(data: data),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6750A4),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 21,
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

  Widget _buildStep({
    required String number,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Number
          SizedBox(
            width: 42,
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6750A4),
              ),
            ),
          ),

          // Icon
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFE9E2F7),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF6750A4),
              size: 27,
            ),
          ),

          const SizedBox(width: 16),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Color(0xFF6750A4),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF25232A),
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: Color(0xFF9B96A3),
          ),
        ],
      ),
    );
  }
}