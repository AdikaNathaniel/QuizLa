import 'package:flutter/material.dart';
import 'dart:async';
import 'categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AboutMePage(),
    );
  }
}

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController otherNamesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  Timer? _timer;
  int _countdown = 10;
  bool _isSubmitted = false;
  int _currentIndex = 0;

  void _startCountdown() {
    setState(() {
      _isSubmitted = true;
      _countdown = 10;
    });
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        _navigateToCategoriesPage();
      }
    });
  }

  void _navigateToCategoriesPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CategoriesPage(),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    firstNameController.dispose();
    otherNamesController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "About Me",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your first name",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: firstNameController,
              enabled: !_isSubmitted,
              decoration: InputDecoration(
                hintText: "First Name",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: _isSubmitted ? const Color(0xFFE5E5E5) : const Color(0xFFF7F7F7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Enter your other names",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: otherNamesController,
              enabled: !_isSubmitted,
              decoration: InputDecoration(
                hintText: "Other Names",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: _isSubmitted ? const Color(0xFFE5E5E5) : const Color(0xFFF7F7F7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Describe yourself",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: descriptionController,
              enabled: !_isSubmitted,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Briefly describe yourself and your interests",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: _isSubmitted ? const Color(0xFFE5E5E5) : const Color(0xFFF7F7F7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            
            if (_isSubmitted) ...[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.orange,
                      size: 48,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Profile Submitted Successfully!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Redirecting to Categories in $_countdown seconds...",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isSubmitted ? null : () {
                  // Validate that at least first name is entered
                  if (firstNameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter your first name"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  
                  _startCountdown();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isSubmitted ? Colors.grey : Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  _isSubmitted ? "Submitted" : "Submit",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) { // If Categories is tapped
            _navigateToCategoriesPage();
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
      ),
    );
  }
}