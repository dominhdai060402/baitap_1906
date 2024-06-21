import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7BCE8),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0), // Thay đổi giá trị này theo nhu cầu của bạn
              child: Text(
                'Welcome To',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Text(
              'NotePro',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily:  'Poppins',
              ),
            ),
            Container(
              width: 350,
              height: 350,
              margin: const EdgeInsets.only(left: 0.0, top: 70.0, right: 0.0, bottom: 0.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDE2FF), // Màu nền của hình chữ nhật
                borderRadius: BorderRadius.circular(30.0), // Bo góc
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        hintStyle: TextStyle(
                          color: Color(0xFF575757), // Màu của hintText
                        ),
                        // màu nền textfield
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      margin: const EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          hintStyle: TextStyle(
                            color: Color(0xFF575757), // Màu của hintText
                          ),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                    width: double.infinity, // Chiều rộng của Container sẽ chiếm toàn bộ không gian khả dụng
                    child: ElevatedButton(
                      onPressed: () {
                        // chuyển sang màn home
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text('Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8884FF), // Màu nền của nút
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}