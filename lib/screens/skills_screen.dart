import 'package:flutter/material.dart';
import '../portfolio_data.dart';

class SkillsScreen extends StatefulWidget {
  final PortfolioData data;

  const SkillsScreen({
    super.key,
    required this.data,
  });

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final TextEditingController skillController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void addSkill() {
    String skill = skillController.text.trim();

    if (skill.isNotEmpty) {
      setState(() {
        widget.data.skills.add(skill);
        skillController.clear();
      });
    }
  }

  void removeSkill(int index) {
    setState(() {
      widget.data.skills.removeAt(index);
    });
  }

  @override
  void dispose() {
    skillController.dispose();
    super.dispose();
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
          'My Skills',
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
            'Showcase your skills.',
            style: TextStyle(
              fontSize: 29,
              height: 1.15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25232A),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Add the skills you want to highlight in your portfolio.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF77727F),
            ),
          ),

          const SizedBox(height: 30),

          // Skill Input
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: TextField(
              controller: skillController,
              decoration: InputDecoration(
                labelText: 'Skill',
                hintText: 'e.g. Flutter',
                prefixIcon: const Icon(
                  Icons.code_rounded,
                  color: Color(0xFF6750A4),
                ),
                suffixIcon: IconButton(
                  onPressed: addSkill,
                  icon: const Icon(
                    Icons.add_circle_rounded,
                    color: Color(0xFF6750A4),
                    size: 28,
                  ),
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
          ),

          const SizedBox(height: 12),

          // Add Skill Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: addSkill,
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
                    Icons.add_rounded,
                    size: 21,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Add Skill',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 35),

          // Skills Heading
          const Text(
            'Your Skills',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25232A),
            ),
          ),

          const SizedBox(height: 15),

          // Skills Grid
          if (widget.data.skills.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.code_off_rounded,
                    size: 40,
                    color: Color(0xFF9B96A3),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No skills added yet.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF77727F),
                    ),
                  ),
                ],
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.data.skills.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,

                // Card ki height barha di
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                return _buildSkillCard(
                  skill: widget.data.skills[index],
                  index: index,
                );
              },
            ),

          const SizedBox(height: 30),

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

  Widget _buildSkillCard({
    required String skill,
    required int index,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Color(0xFF6750A4),
            size: 28,
          ),

          const SizedBox(height: 8),

          Text(
            skill,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25232A),
            ),
          ),

          const SizedBox(height: 6),

          GestureDetector(
            onTap: () {
              removeSkill(index);
            },
            child: const Text(
              'Remove',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF9B96A3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}