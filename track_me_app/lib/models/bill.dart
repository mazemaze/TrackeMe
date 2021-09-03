import 'package:flutter/cupertino.dart';

class Bill with ChangeNotifier {
  final String? name;
  final String? category;
  final int? amount;
  final DateTime? deadline;
  final DateTime? createdAt;

  Bill({this.name, this.category, this.amount, this.deadline, this.createdAt});
}
