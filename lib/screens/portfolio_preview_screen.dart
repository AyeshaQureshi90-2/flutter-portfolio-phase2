import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:share_plus/share_plus.dart';

import '../portfolio_data.dart';

class PortfolioPreviewScreen extends StatefulWidget {
  final PortfolioData data;

  const PortfolioPreviewScreen({
    super.key,
    required this.data,
  });

  @override
  State<PortfolioPreviewScreen> createState() =>
      _PortfolioPreviewScreenState();
}

class _PortfolioPreviewScreenState extends State<PortfolioPreviewScreen> {
  final GlobalKey portfolioKey = GlobalKey();

  bool isSaving = false;
  bool isSharing = false;

  Future<Uint8List?> _capturePortfolio() async {
    try {
      final boundary = portfolioKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;

      if (boundary == null) {
        return null;
      }

      final image = await boundary.toImage(
        pixelRatio: 3.0,
      );

      final byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      return byteData?.buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }

  Future<void> saveToGallery() async {
    setState(() {
      isSaving = true;
    });

    try {
      final bytes = await _capturePortfolio();

      if (bytes == null) {
        throw Exception('Portfolio image could not be created.');
      }

      await Gal.putImageBytes(
        bytes,
        name: 'my_portfolio',
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Portfolio saved to Gallery successfully!'),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not save portfolio: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  Future<void> sharePortfolio() async {
    setState(() {
      isSharing = true;
    });

    try {
      final bytes = await _capturePortfolio();

      if (bytes == null) {
        throw Exception('Portfolio image could not be created.');
      }

      await SharePlus.instance.share(
        ShareParams(
          text: 'Check out my portfolio!',
          files: [
            XFile.fromData(
              bytes,
              name: 'my_portfolio.png',
              mimeType: 'image/png',
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not share portfolio: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSharing = false;
        });
      }
    }
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
          'Portfolio Preview',
          style: TextStyle(
            color: Color(0xFF25232A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 20),
              child: RepaintBoundary(
                key: portfolioKey,
                child: _buildPortfolioCard(),
              ),
            ),
          ),

          // Action Buttons
          Container(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: isSharing ? null : sharePortfolio,
                      icon: isSharing
                          ? const SizedBox(
                              width: 19,
                              height: 19,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              Icons.share_rounded,
                              size: 20,
                            ),
                      label: const Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6750A4),
                        side: const BorderSide(
                          color: Color(0xFF6750A4),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: SizedBox(
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: isSaving ? null : saveToGallery,
                      icon: isSaving
                          ? const SizedBox(
                              width: 19,
                              height: 19,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(
                              Icons.download_rounded,
                              size: 20,
                            ),
                      label: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6750A4),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          image: AssetImage('assets/portfolio_bg.jfif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.black.withValues(alpha: 0.48),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Name
            Text(
              widget.data.name.isEmpty
                  ? 'Your Name'
                  : widget.data.name,
              style: const TextStyle(
                fontSize: 32,
                height: 1.1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            // Profession
            Text(
              widget.data.profession.isEmpty
                  ? 'Your Profession'
                  : widget.data.profession,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE7DFFF),
              ),
            ),

            const SizedBox(height: 28),

            _buildPortfolioSection(
              title: 'ABOUT ME',
              value: widget.data.about,
              icon: Icons.person_outline_rounded,
            ),

            _buildPortfolioSection(
              title: 'EDUCATION',
              value: widget.data.education,
              icon: Icons.school_outlined,
            ),

            _buildPortfolioSection(
              title: 'EXPERIENCE',
              value: widget.data.experience,
              icon: Icons.work_outline_rounded,
            ),

            if (widget.data.skills.isNotEmpty) ...[
              const SizedBox(height: 24),

              _buildSectionTitle(
                'SKILLS',
                Icons.code_rounded,
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.data.skills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],

            const SizedBox(height: 28),

            _buildSectionTitle(
              'CONTACT',
              Icons.contact_mail_outlined,
            ),

            const SizedBox(height: 14),

            if (widget.data.email.isNotEmpty)
              _buildContactItem(
                Icons.email_outlined,
                widget.data.email,
              ),

            if (widget.data.phone.isNotEmpty)
              _buildContactItem(
                Icons.phone_outlined,
                widget.data.phone,
              ),

            if (widget.data.location.isNotEmpty)
              _buildContactItem(
                Icons.location_on_outlined,
                widget.data.location,
              ),

            if (widget.data.linkedin.isNotEmpty)
              _buildContactItem(
                Icons.work_outline_rounded,
                widget.data.linkedin,
              ),

            if (widget.data.github.isNotEmpty)
              _buildContactItem(
                Icons.code_rounded,
                widget.data.github,
              ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioSection({
    required String title,
    required String value,
    required IconData icon,
  }) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),

        _buildSectionTitle(
          title,
          icon,
        ),

        const SizedBox(height: 9),

        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            height: 1.55,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: const Color(0xFFE7DFFF),
        ),

        const SizedBox(width: 8),

        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
            color: Color(0xFFE7DFFF),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFFE7DFFF),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}