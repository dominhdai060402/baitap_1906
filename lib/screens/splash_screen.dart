import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Xử lí chuyển màn
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7BCE8),
      body: Center(
        child: Column(
          // thuộc tính căn giữa trong column
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Say Good by to',
              style: TextStyle(
                color: Color(0xFF5D576B),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily:  'Poppins',
              ),
            ),
            SizedBox(height: 1), // Khoảng cách giữa các dòng chữ
            Text(
              'Paper Notes',
              style: TextStyle(
                color: Color(0xFF5D576B),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily:  'Poppins',
              ),
            ),
            SizedBox(height: 20), // Khoảng cách giữa dòng chữ và ảnh
            Image.asset(
              'assets/images/logo_note.png',
              width: 158,
              height: 182,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
