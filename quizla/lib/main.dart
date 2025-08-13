import 'package:flutter/material.dart';
import 'get_started.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizLa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _typewriterController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;
  
  String _displayText = '';
  final String _fullText = 'Developed By Nathaniel Adika';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    
    // Initialize image animation controller
    _imageController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    // Initialize typewriter animation controller
    _typewriterController = AnimationController(
      duration: Duration(milliseconds: _fullText.length * 500),
      vsync: this,
    );

    // Scale animation for the image
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.elasticOut,
    ));

    // Rotation animation for the image
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeInOut,
    ));

    // Fade animation for the image
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeIn,
    ));

    // Start animations
    _startAnimations();
    
    // Navigate to GetStartedPage after 20 seconds
    _navigateToGetStarted();
  }

  void _startAnimations() {
    // Start image animation
    _imageController.forward();
    
    // Start typewriter effect after image animation
    Future.delayed(const Duration(milliseconds: 1500), () {
      _startTypewriter();
    });
  }

  void _startTypewriter() {
    _typewriterController.addListener(() {
      final progress = _typewriterController.value;
      final targetIndex = (progress * _fullText.length).floor();
      
      if (targetIndex != _currentIndex && targetIndex <= _fullText.length) {
        setState(() {
          _currentIndex = targetIndex;
          _displayText = _fullText.substring(0, _currentIndex);
        });
      }
    });
    
    _typewriterController.forward();
  }

  void _navigateToGetStarted() {
    Future.delayed(const Duration(seconds: 20), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const GetStartedPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _typewriterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF8C00), // Orange background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated image and title in the center
              AnimatedBuilder(
                animation: _imageController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Transform.rotate(
                        angle: 0, // Remove rotation to keep image straight
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Animated image with shadow and glow effect
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/quizla.jpeg',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // App title with gradient effect
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [Colors.white, Colors.yellow],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: const Text(
                                'QuizLa',
                                style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 80),
              
              // Typewriter effect text at the bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _displayText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Blinking cursor
                    AnimatedBuilder(
                      animation: _typewriterController,
                      builder: (context, child) {
                        return AnimatedOpacity(
                          opacity: (_typewriterController.isAnimating || 
                                   _displayText.length < _fullText.length) ? 
                                   (DateTime.now().millisecondsSinceEpoch % 1000 < 500 ? 1.0 : 0.0) : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: const Text(
                            '|',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}