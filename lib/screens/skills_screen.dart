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

  // Professional skill suggestions
  final List<String> skillSuggestions = [
    // Programming
    'Programming',
    'C',
    'C++',
    'C#',
    'Java',
    'Python',
    'Dart',
    'Kotlin',
    'Swift',
    'PHP',
    'Ruby',
    'Go',
    'Rust',

    // Mobile Development
    'Flutter',
    'Flutter Development',
    'Android Development',
    'iOS Development',
    'Mobile App Development',
    'React Native',
    'Kotlin Android Development',

    // Web Development
    'Web Development',
    'Frontend Development',
    'Backend Development',
    'Full Stack Development',
    'HTML',
    'CSS',
    'JavaScript',
    'TypeScript',
    'React',
    'Next.js',
    'Angular',
    'Vue.js',
    'Node.js',
    'Express.js',
    'Django',
    'Laravel',
    'WordPress',

    // UI/UX Design
    'UI Design',
    'UX Design',
    'UI/UX Design',
    'Figma',
    'Adobe XD',
    'Wireframing',
    'Prototyping',
    'Design Thinking',

    // Graphic Designing
    'Graphic Design',
    'Graphic Designing',
    'Adobe Photoshop',
    'Adobe Illustrator',
    'Adobe InDesign',
    'Logo Design',
    'Brand Identity Design',
    'Poster Design',
    'Banner Design',
    'Social Media Design',
    'Print Design',
    'Typography',
    'Photo Editing',
    'Canva',

    // Video Editing & Animation
    'Video Editing',
    'Video Production',
    'Video Making',
    'Motion Graphics',
    'Animation',
    '2D Animation',
    '3D Animation',
    'Adobe Premiere Pro',
    'Adobe After Effects',
    'DaVinci Resolve',
    'CapCut',
    'Filmora',
    'Final Cut Pro',
    'Blender',

    // Database
    'Database Management',
    'SQL',
    'MySQL',
    'PostgreSQL',
    'SQLite',
    'MongoDB',
    'Firebase',
    'Database Design',

    // Cloud & API
    'Cloud Computing',
    'AWS',
    'Microsoft Azure',
    'Google Cloud',
    'REST API',
    'API Development',
    'API Integration',

    // AI & Data
    'Artificial Intelligence',
    'Machine Learning',
    'Deep Learning',
    'Data Science',
    'Data Analysis',
    'Natural Language Processing',
    'Computer Vision',
    'Generative AI',
    'Prompt Engineering',

    // Cyber Security
    'Cyber Security',
    'Network Security',
    'Ethical Hacking',
    'Information Security',
    'Cryptography',

    // Networking
    'Computer Networking',
    'Network Administration',
    'TCP/IP',
    'LAN/WAN',
    'Cisco Networking',

    // Software & Tools
    'Git',
    'GitHub',
    'GitLab',
    'Version Control',
    'Visual Studio Code',
    'Android Studio',
    'Jira',
    'Trello',

    // Microsoft Office
    'Microsoft Word',
    'Microsoft Excel',
    'Microsoft PowerPoint',
    'Microsoft Access',
    'Data Entry',
    'Microsoft Office',

    // Digital Marketing
    'Digital Marketing',
    'Social Media Marketing',
    'Search Engine Optimization',
    'SEO',
    'Search Engine Marketing',
    'Email Marketing',
    'Content Marketing',
    'Affiliate Marketing',
    'Google Ads',
    'Social Media Management',

    // Content Creation
    'Content Creation',
    'Content Writing',
    'Copywriting',
    'Blog Writing',
    'Creative Writing',
    'Technical Writing',
    'Script Writing',
    'Proofreading',

    // Photography
    'Photography',
    'Product Photography',
    'Portrait Photography',
    'Photo Retouching',
    'Lightroom',
    'Adobe Lightroom',

    // Professional Skills
    'Project Management',
    'Team Management',
    'Communication Skills',
    'Leadership',
    'Problem Solving',
    'Time Management',
    'Customer Service',
    'Research',
    'Presentation Skills',
  ];

  // Add skill and save it
  Future<void> addSkill() async {
    String skill = skillController.text.trim();

    if (skill.isNotEmpty) {
      // Same skill dobara add na ho
      bool alreadyExists = widget.data.skills.any(
        (existingSkill) =>
            existingSkill.toLowerCase() == skill.toLowerCase(),
      );

      if (!alreadyExists) {
        setState(() {
          widget.data.skills.add(skill);
          skillController.clear();
        });

        // Skill ko phone mein save karna
        await widget.data.saveData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('This skill has already been added.'),
          ),
        );
      }
    }
  }

  // Remove skill and save updated list
  Future<void> removeSkill(int index) async {
    setState(() {
      widget.data.skills.removeAt(index);
    });

    // Updated skills ko phone mein save karna
    await widget.data.saveData();
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

          // Professional Autocomplete
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              String query =
                  textEditingValue.text.trim().toLowerCase();

              if (query.isEmpty) {
                return const Iterable<String>.empty();
              }

              return skillSuggestions.where(
                (skill) =>
                    skill.toLowerCase().contains(query),
              );
            },

            onSelected: (String selection) {
              skillController.text = selection;

              skillController.selection =
                  TextSelection.fromPosition(
                TextPosition(
                  offset: skillController.text.length,
                ),
              );
            },

            optionsViewBuilder: (
              BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options,
            ) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 44,
                    constraints: const BoxConstraints(
                      maxHeight: 250,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        final String option =
                            options.elementAt(index);

                        return InkWell(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 13,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.auto_awesome_rounded,
                                  color: Color(0xFF6750A4),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF25232A),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: Color(0xFF9B96A3),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },

            fieldViewBuilder: (
              BuildContext context,
              TextEditingController controller,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted,
            ) {
              // Autocomplete controller ko hamare controller
              // ke sath connect karna
              if (controller.text != skillController.text) {
                controller.value = skillController.value;
              }

              controller.addListener(() {
                if (skillController.text != controller.text) {
                  skillController.value = controller.value;
                }
              });

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onSubmitted: (_) {
                    onFieldSubmitted();
                  },
                  decoration: InputDecoration(
                    labelText: 'Skill',
                    hintText: 'e.g. Flutter, Graphic Design',
                    prefixIcon: const Icon(
                      Icons.code_rounded,
                      color: Color(0xFF6750A4),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        addSkill();
                      },
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
                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 17,
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          // Add Skill Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                addSkill();
              },
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

          const Text(
            'Your Skills',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25232A),
            ),
          ),

          const SizedBox(height: 15),

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