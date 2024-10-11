import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/routes/admin_page.dart';
import 'package:flutter_application_1/app/routes/auth_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final AuthController authController = Get.put(AuthController());

 
  double _scaleFactor = 1.0;
  double _adminScaleFactor = 1.0;
  double _daftarScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2FEFA),
              Color(0xFF0ED2F7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.home_rounded,
                    size: 100,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                    fontFamily: 'Arial',
                  ),
                ),
                SizedBox(height: 40),

                // Username and Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.6),
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.6),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),

                      // Animated login button
                      GestureDetector(
                        onTapDown: (_) {
                          setState(() {
                            _scaleFactor = 0.9; // Scale down ketika ditekan
                          });
                        },
                        onTapUp: (_) {
                          setState(() {
                            _scaleFactor = 1.0; // Kembali ke ukuran normal
                          });
                          authController.login();
                        },
                        onTapCancel: () {
                          setState(() {
                            _scaleFactor = 1.0;
                          });
                        },
                        child: Transform.scale(
                          scale: _scaleFactor,
                          child: ElevatedButton(
                            onPressed: () {
                              authController.login();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                'LOG IN',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFF0ED2F7), backgroundColor: Colors.white, minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 12,
                              shadowColor: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Animated admin button
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _adminScaleFactor = 0.9; // Scale down ketika ditekan
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      _adminScaleFactor = 1.0; // Kembali ke ukuran normal
                    });
                    Get.to(() => AdminPage());
                  },
                  onTapCancel: () {
                    setState(() {
                      _adminScaleFactor = 1.0;
                    });
                  },
                  child: Transform.scale(
                    scale: _adminScaleFactor,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => AdminPage()); // Navigasi ke halaman Admin
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'ADMIN',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue[900], backgroundColor: Colors.white.withOpacity(0.5), minimumSize: Size(200, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Animated register button
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _daftarScaleFactor = 0.9; // Scale down ketika ditekan
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      _daftarScaleFactor = 1.0; // Kembali ke ukuran normal
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      _daftarScaleFactor = 1.0;
                    });
                  },
                  child: Transform.scale(
                    scale: _daftarScaleFactor,
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic untuk tombol daftar
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'DAFTAR',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue[900], backgroundColor: Colors.white.withOpacity(0.5), minimumSize: Size(200, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Forgot password text
                TextButton(
                  onPressed: () {
                    // Aksi jika pengguna lupa password
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
