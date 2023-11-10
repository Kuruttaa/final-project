import 'package:final_project_edspert/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB7B8B6),
      appBar: AppBar(
        backgroundColor: Color(0xFF34675C),
        title: Text(
          'Login',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFB7B8B6)),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(height: 56),
                Image.asset('assets/login.png'),
                const SizedBox(height: 40),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF34675C)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Selamat Datang di Aplikasi Latihan dan Konsultasi Soal',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF34675C)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 59),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34675C)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/google-logo.png',
                              width: 19.51,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Sign in With Google',
                              style: TextStyle(color: Color(0xFFB7B8B6)),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34675C)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/apple-logo.png',
                              width: 19.51,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Sign in With Apple ID',
                              style: TextStyle(color: Color(0xFFB7B8B6)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
