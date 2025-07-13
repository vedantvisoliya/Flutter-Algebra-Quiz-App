import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:math_quiz_game/components/my_text_field_answer.dart';
import 'package:math_quiz_game/model/equation_model.dart';
import 'package:math_quiz_game/pages/solution_page.dart';
import 'package:math_quiz_game/services/auth/auth_service.dart';
import 'package:math_quiz_game/widgets/keyboard.dart';
import 'package:math_quiz_game/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  final String emailAddress;
  const HomePage({super.key, required this.emailAddress});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController answerController = TextEditingController();
  final AuthService authService = AuthService();
  int? userLevel;

  // Load async only once (not inside build)

  Future<void> _initAsync() async {
    // Perform async work here
    final getUserLevel = await authService.getUserLevel(
      authService.getCurrentUser()?.uid ?? "",
    );
    setState(() {
      userLevel = getUserLevel;
    });
  }

  void resetUserLevel() {
    authService.resetUserLevel(authService.getCurrentUser()?.uid ?? "");
    setState(() {
      userLevel = 1;
    });
  }


  void onSubmit(List<EquationModel> equations) {
    if (answerController.text.trim() ==
        equations[userLevel ?? 0].solution.join(",")) {
      authService.updateUserLevel(
        authService.getCurrentUser()?.uid ?? "",
        ((userLevel ?? 0) + 1 <= 90 ? 90 : (userLevel ?? 0) + 1),
      );
      answerController.clear();
      setState(() {
        if (userLevel != null && userLevel! < 90) {
          userLevel = userLevel! + 1;
        }
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Correct answer")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Incorrect answer")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<EquationModel>('equations');
    final equations = box.values.toList();

    if (userLevel == null) {
      Future.microtask(() => _initAsync());
      return const Center(child: CircularProgressIndicator());
    }


    final currentEquation = equations[userLevel!];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Level ${currentEquation.id}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SolutionPage(solution: equations[userLevel ?? 0].steps),
                ),
              );
            },
            icon: Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
      drawer: MyDrawer(
        emailAddress: widget.emailAddress,
        resetUserLevel: resetUserLevel,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentEquation.equation,
                style: GoogleFonts.lora(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                
              const SizedBox(height: 20),
                
              MyTextFieldAnswer(controller: answerController),
                
              Expanded(child: const SizedBox()),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Keyboard(
                    controller: answerController,
                    onSubmit: () => onSubmit(equations),
                  ),
                ],
              ),
                
              Expanded(child: const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
