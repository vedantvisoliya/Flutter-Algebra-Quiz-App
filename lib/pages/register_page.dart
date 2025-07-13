// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz_game/components/my_button.dart';
import 'package:math_quiz_game/components/my_text_field.dart';
import 'package:math_quiz_game/pages/otp_verify_page.dart';
import 'package:math_quiz_game/services/otp/otp_web_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function() togglePage;
  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    OtpWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Algebra Quiz Game",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Text(
                    "Register.",
                    style: GoogleFonts.robotoMono(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              MyTextField(controller: passwordController, hintText: "Password"),

              const SizedBox(height: 10),

              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
              ),

              const SizedBox(height: 20),

              MyButton(
                onTap: () async {
                  try {
                    if (passwordController.text ==
                            confirmPasswordController.text &&
                        emailController.text.isNotEmpty) {

                      OtpWebService().sendOtp(emailController.text.trim());
                      String otp = await OtpWebService().getOtp();
                      // print(otp);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerifyPage(
                            otp: otp,
                            emailAddress: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("OTP sent to ${emailController.text}"),
                        ),
                      );
                    }
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                text: "Sign Up",
              ),

              const Spacer(flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.togglePage,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
