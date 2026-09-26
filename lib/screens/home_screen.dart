import 'package:flutter/material.dart';
import '../portfolio_data.dart';
import 'portfolio_builder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
          children: [

            // Top Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Portfolio',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF25232A),
                  ),
                ),

                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Color(0xFF6750A4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // Decorative Icon
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFE9E2F7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFF6750A4),
                size: 30,
              ),
            ),

            const SizedBox(height: 25),

            // Main Heading
            const Text(
              'Your story,\nprofessionally presented.',
              style: TextStyle(
                fontSize: 36,
                height: 1.12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25232A),
              ),
            ),

            const SizedBox(height: 18),

            // Description
            const Text(
              'Create a portfolio that brings together '
              'your profile, skills, experience and contact information.',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF77727F),
              ),
            ),

            const SizedBox(height: 38),

            // Start Building Button
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                         PortfolioBuilderScreen(data: PortfolioData()),
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
                      'Start Building',
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

            const SizedBox(height: 55),

            // Bottom Message
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline_rounded,
                    color: Color(0xFF6750A4),
                    size: 27,
                  ),

                  SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      'Build your profile. Showcase your skills. '
                      'Share your journey.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Color(0xFF55515D),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Footer
            const Center(
              child: Text(
                'Create something that represents you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF918C99),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}