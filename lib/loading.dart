import 'package:flutter/material.dart';
import 'login.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _animateSplash();
  }

  _animateSplash() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      opacityLevel = 1.0;
    });

    await Future.delayed(Duration(seconds: 4));

    // Navigasi ke Halaman Login
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC586E3),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Images/logo.png',
                width: 300,
                height: 330,
              ),
              Text(
                'BOOKLAB',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '© 2024 - KELOMPOK 1',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
