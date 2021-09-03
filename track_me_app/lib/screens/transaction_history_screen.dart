import 'package:flutter/material.dart';
import 'package:split_bil_app/widget/history_card_list.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  static const routeName = "transaction_history";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TransactionHistoryList(),
        ],
      ),
    );
  }
}
