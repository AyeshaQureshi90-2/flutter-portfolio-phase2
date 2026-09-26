import 'package:flutter/material.dart';
import '../portfolio_data.dart';

class ContactScreen extends StatefulWidget {
  final PortfolioData data;

  const ContactScreen({
    super.key,
    required this.data,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController githubController = TextEditingController();

  bool contactSaved = false;

  @override
  void initState() {
    super.initState();

    // Previously saved contact information ko fields mein show karna
    emailController.text = widget.data.email;
    phoneController.text = widget.data.phone;
    locationController.text = widget.data.location;
    linkedinController.text = widget.data.linkedin;
    githubController.text = widget.data.github;

    // Agar pehle contact information save ki gayi thi
    if (widget.data.email.isNotEmpty ||
        widget.data.phone.isNotEmpty ||
        widget.data.location.isNotEmpty ||
        widget.data.linkedin.isNotEmpty ||
        widget.data.github.isNotEmpty) {
      contactSaved = true;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    linkedinController.dispose();
    githubController.dispose();
    super.dispose();
  }

  void saveContact() {
    // Contact information shared PortfolioData mein save karna
    widget.data.email = emailController.text.trim();
    widget.data.phone = phoneController.text.trim();
    widget.data.location = locationController.text.trim();
    widget.data.linkedin = linkedinController.text.trim();
    widget.data.github = githubController.text.trim();

    setState(() {
      contactSaved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F5FB),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF25232A),
          ),
        ),

        title: const Text(
          'Contact Me',
          style: TextStyle(
            color: Color(0xFF25232A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 15, 22, 30),
        children: [
          // Heading
          const Text(
            'Let people reach you.',
            style: TextStyle(
              fontSize: 29,
              height: 1.15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25232A),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Add your contact details so people can connect with you.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF77727F),
            ),
          ),

          const SizedBox(height: 30),

          // Email
          _buildTextField(
            controller: emailController,
            label: 'Email',
            hint: 'example@email.com',
            icon: Icons.email_outlined,
          ),

          const SizedBox(height: 16),

          // Phone
          _buildTextField(
            controller: phoneController,
            label: 'Phone',
            hint: '+92 300 1234567',
            icon: Icons.phone_outlined,
          ),

          const SizedBox(height: 16),

          // Location
          _buildTextField(
            controller: locationController,
            label: 'Location',
            hint: 'e.g. Islamabad, Pakistan',
            icon: Icons.location_on_outlined,
          ),

          const SizedBox(height: 16),

          // LinkedIn
          _buildTextField(
            controller: linkedinController,
            label: 'LinkedIn',
            hint: 'Enter your LinkedIn profile',
            icon: Icons.work_outline_rounded,
          ),

          const SizedBox(height: 16),

          // GitHub
          _buildTextField(
            controller: githubController,
            label: 'GitHub',
            hint: 'Enter your GitHub profile',
            icon: Icons.code_rounded,
          ),

          const SizedBox(height: 30),

          // Save Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: saveContact,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6750A4),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_rounded,
                    size: 21,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Save Contact',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Saved Contact Information
          if (contactSaved) ...[
            const SizedBox(height: 35),

            const Text(
              'Your Contact Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25232A),
              ),
            ),

            const SizedBox(height: 15),

            _buildInformationCard(
              title: 'Email',
              value: emailController.text,
            ),

            _buildInformationCard(
              title: 'Phone',
              value: phoneController.text,
            ),

            _buildInformationCard(
              title: 'Location',
              value: locationController.text,
            ),

            _buildInformationCard(
              title: 'LinkedIn',
              value: linkedinController.text,
            ),

            _buildInformationCard(
              title: 'GitHub',
              value: githubController.text,
            ),
          ],

          const SizedBox(height: 25),

          // Back Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF6750A4),
                side: const BorderSide(
                  color: Color(0xFF6750A4),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: const Text(
                'Back to Builder',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationCard({
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6750A4),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value.isEmpty ? 'Not added yet' : value,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF25232A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF6750A4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 17,
          ),
        ),
      ),
    );
  }
}