import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz_game/services/auth/auth_service.dart';
import 'package:math_quiz_game/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final String emailAddress;
  final void Function() resetUserLevel;
  const MyDrawer({
    super.key,
    required this.emailAddress,
    required this.resetUserLevel,
  });

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),

              Image.asset("assets/images/algebra.png", width: 60, height: 60),

              const SizedBox(height: 20),

              Text(
                "Algebra Quiz Game",
                style: GoogleFonts.lora(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                emailAddress,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(flex: 2),

              const Divider(),

              ListTile(
                title: Text(
                  "Dark Mode",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  },
                ),
              ),

              const SizedBox(height: 10),

              ListTile(
                title: Text(
                  "Reset Level",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    resetUserLevel();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              ListTile(
                title: Text(
                  "Logout",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    authService.signOut();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
