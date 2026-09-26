import 'package:flutter/material.dart';
import '../portfolio_data.dart';

class AboutScreen extends StatefulWidget {
  final PortfolioData data;

  const AboutScreen({
    super.key,
    required this.data,
  });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  bool informationSaved = false;

  @override
  void initState() {
    super.initState();

    // Previously saved information ko wapas fields mein show karna
    nameController.text = widget.data.name;
    professionController.text = widget.data.profession;
    aboutController.text = widget.data.about;
    educationController.text = widget.data.education;
    experienceController.text = widget.data.experience;

    // Agar pehle information save ki gayi thi
    if (widget.data.name.isNotEmpty ||
        widget.data.profession.isNotEmpty ||
        widget.data.about.isNotEmpty ||
        widget.data.education.isNotEmpty ||
        widget.data.experience.isNotEmpty) {
      informationSaved = true;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    professionController.dispose();
    aboutController.dispose();
    educationController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  void saveInformation() {
    // Information shared PortfolioData mein save karna
    widget.data.name = nameController.text.trim();
    widget.data.profession = professionController.text.trim();
    widget.data.about = aboutController.text.trim();
    widget.data.education = educationController.text.trim();
    widget.data.experience = experienceController.text.trim();

    setState(() {
      informationSaved = true;
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
          'About Me',
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
          const Text(
            'Tell us about yourself.',
            style: TextStyle(
              fontSize: 29,
              height: 1.15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25232A),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Add your basic information and professional background.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF77727F),
            ),
          ),

          const SizedBox(height: 30),

          Form(
            child: Column(
              children: [
                _buildTextField(
                  controller: nameController,
                  label: 'Full Name',
                  hint: 'Enter your name',
                  icon: Icons.person_outline_rounded,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: professionController,
                  label: 'Profession',
                  hint: 'e.g. Flutter Developer',
                  icon: Icons.work_outline_rounded,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: aboutController,
                  label: 'About You',
                  hint: 'Write a short introduction',
                  icon: Icons.edit_note_rounded,
                  maxLines: 4,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: educationController,
                  label: 'Education',
                  hint: 'Enter your education',
                  icon: Icons.school_outlined,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: experienceController,
                  label: 'Experience',
                  hint: 'Enter your experience',
                  icon: Icons.timeline_rounded,
                  maxLines: 3,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Save Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: saveInformation,
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
                    'Save Information',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Saved Information
          if (informationSaved) ...[
            const SizedBox(height: 35),

            const Text(
              'Your Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25232A),
              ),
            ),

            const SizedBox(height: 15),

            _buildInformationCard(
              title: 'Full Name',
              value: nameController.text,
            ),

            _buildInformationCard(
              title: 'Profession',
              value: professionController.text,
            ),

            _buildInformationCard(
              title: 'About You',
              value: aboutController.text,
            ),

            _buildInformationCard(
              title: 'Education',
              value: educationController.text,
            ),

            _buildInformationCard(
              title: 'Experience',
              value: experienceController.text,
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
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
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