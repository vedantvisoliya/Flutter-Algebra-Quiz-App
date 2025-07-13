import 'package:hive/hive.dart';

part 'equation_model.g.dart';

@HiveType(typeId: 0)
class EquationModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String equation;

  @HiveField(2)
  List<dynamic> solution;

  @HiveField(3)
  bool solved;

  @HiveField(4)
  List<String> steps;

  EquationModel({
    required this.id,
    required this.equation,
    required this.solution,
    required this.solved,
    required this.steps,
  });
}