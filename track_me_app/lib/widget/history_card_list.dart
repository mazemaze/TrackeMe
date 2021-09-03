import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bil_app/provider/bill_provider.dart';
import 'package:split_bil_app/widget/history_card.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final billData = Provider.of<Bills>(context);
    final bills = billData.items;
    return Flexible(
      fit: FlexFit.tight,
      child: ListView.builder(
        itemCount: bills.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: bills[i],
          child: TransactionHistoryCard(),
        ),
      ),
    );
  }
}
