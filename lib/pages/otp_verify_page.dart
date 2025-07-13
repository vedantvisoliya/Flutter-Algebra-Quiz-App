import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz_game/components/my_button.dart';
import 'package:math_quiz_game/components/my_text_field.dart';
import 'package:math_quiz_game/services/auth/auth_service.dart';

class OtpVerifyPage extends StatelessWidget {
  final String otp;
  final String emailAddress;
  final String password;
  const OtpVerifyPage({
    super.key,
    required this.otp,
    required this.emailAddress,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();
    final AuthService authService = AuthService();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
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
                    "OTP Verification.",
                    style: GoogleFonts.robotoMono(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: otpController,
                hintText: "Enter OTP",
                maxLength: 6,
              ),

              const SizedBox(height: 20),

              MyButton(
                onTap: () async {
                  if (otpController.text == otp) {
                    await authService.signUpWithEmailAndPassword(
                      emailAddress,
                      password,
                      context,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                  }
                },
                text: "Verify OTP",
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
