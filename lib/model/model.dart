
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Model {


  @HiveField(1)
  int? amount;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? category;

  Model({
    required this.amount,
    required this.description,
    required this.category,
  });
}