import 'package:demo/constants.dart';
import 'package:demo/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/auth_image.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, .1),
                  Color.fromRGBO(23, 23, 23, .9),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 223,
                      child: Text(
                        'Be happy with you finance',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.interTextTheme()
                            .displaySmall
                            ?.copyWith(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w200),
                      ),
                    ),
                    const SizedBox(height: 60),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Screen.testarea.name),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(312, 50),
                      ),
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.interTextTheme()
                            .labelLarge
                            ?.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Screen.expenses.name),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(312, 50),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.interTextTheme()
                            .labelLarge
                            ?.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
