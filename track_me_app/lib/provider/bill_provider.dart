import 'package:flutter/cupertino.dart';
import 'package:split_bil_app/models/bill.dart';

class Bills with ChangeNotifier {
  List<Bill> _items = [
    Bill(
      name: "裕次郎",
      category: "食費",
      amount: 5000,
      deadline: DateTime(2021, 9, 30),
      createdAt: DateTime(2021, 7, 30, 17, 30),
    ),
    Bill(
      name: "裕次郎",
      category: "日用品",
      amount: 5000,
      deadline: DateTime(2021, 10, 30),
      createdAt: DateTime(2021, 6, 30, 10, 30),
    ),
    Bill(
      name: "梨乃",
      category: "食費",
      amount: 5000,
      deadline: DateTime(2021, 9, 26),
      createdAt: DateTime(2021, 7, 15, 17, 30),
    ),
  ];

  List<Bill> get items {
    return [..._items];
  }

  List<Bill> totalAmountByName() {
    List<String> _names = [];
    List<Bill> bills = [];
    int totalAmount = 0;
    for (int i = 0; i < _items.length; i++) {
      if (!_names.contains(_items[i].name)) {
        _names.add(_items[i].name!);
      }
    }
    for (int i = 0; i < _names.length; i++) {
      List<Bill> list =
          _items.where((element) => element.name == _names[i]).toList();
      for (int j = 0; j < list.length; j++) {
        totalAmount += list[j].amount!;
      }
      bills.add(
        Bill(name: _names[i], amount: totalAmount),
      );
      totalAmount = 0;
    }
    return bills;
  }

  List<Bill> findByName(String name) {
    return _items.where((element) => element.name == name).toList();
  }

  void addItem(Bill bill) {
    _items.add(bill);
    notifyListeners();
  }
}
