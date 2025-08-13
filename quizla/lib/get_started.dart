import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top image with proper aspect ratio and constraints
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/TraditionalImagery.jpeg',
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover, // This ensures the image covers the container properly
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Quizzia helps you challenge and assess your knowledge in any field of study',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'We\'ve got various categories of quizzes, including mathematics, science, anime, books, music and so much more. Let\'s get started now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15, 
                  height: 1.4,
                  color: Colors.grey,
                ),
              ),
            ),

            const Spacer(),

            // Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                    // Navigate to next page
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Terms and Privacy
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'By clicking Get Started, you agree to our '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, height: 1.4),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}