import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PortfolioData {
  // About Information
  String name = '';
  String profession = '';
  String about = '';
  String education = '';
  String experience = '';

  // Skills
  List<String> skills = [];

  // Contact Information
  String email = '';
  String phone = '';
  String location = '';
  String linkedin = '';
  String github = '';

  // Save all portfolio data
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    // About Information
    await prefs.setString('name', name);
    await prefs.setString('profession', profession);
    await prefs.setString('about', about);
    await prefs.setString('education', education);
    await prefs.setString('experience', experience);

    // Skills
    await prefs.setString(
      'skills',
      jsonEncode(skills),
    );

    // Contact Information
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setString('location', location);
    await prefs.setString('linkedin', linkedin);
    await prefs.setString('github', github);
  }

  // Load saved portfolio data
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // About Information
    name = prefs.getString('name') ?? '';
    profession = prefs.getString('profession') ?? '';
    about = prefs.getString('about') ?? '';
    education = prefs.getString('education') ?? '';
    experience = prefs.getString('experience') ?? '';

    // Skills
    String savedSkills = prefs.getString('skills') ?? '[]';

    skills = List<String>.from(
      jsonDecode(savedSkills),
    );

    // Contact Information
    email = prefs.getString('email') ?? '';
    phone = prefs.getString('phone') ?? '';
    location = prefs.getString('location') ?? '';
    linkedin = prefs.getString('linkedin') ?? '';
    github = prefs.getString('github') ?? '';
  }

  // Clear saved portfolio data
  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    // Clear current data too
    name = '';
    profession = '';
    about = '';
    education = '';
    experience = '';
    skills = [];
    email = '';
    phone = '';
    location = '';
    linkedin = '';
    github = '';
  }
}