import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bil_app/provider/bill_provider.dart';
import 'package:split_bil_app/widget/bill_card.dart';

class BillListView extends StatelessWidget {
  const BillListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final billsData = Provider.of<Bills>(context);
    final bills = billsData.totalAmountByName();
    return Container(
      height: 240,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bills.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: bills[i],
          child: BillCard(),
        ),
      ),
    );
  }
}
