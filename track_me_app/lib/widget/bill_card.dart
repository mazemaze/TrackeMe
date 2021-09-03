import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bil_app/models/bill.dart';
import 'package:split_bil_app/provider/bill_provider.dart';

class BillCard extends StatelessWidget {
  const BillCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bill = Provider.of<Bill>(context);
    final billsData = Provider.of<Bills>(context);
    return Container(
      padding: EdgeInsets.all(16),
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${bill.name}さんへ返す金額",
                  ),
                  SizedBox(height: 16),
                  Text(
                    "${bill.amount}円",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ),
          billsData.totalAmountByName().first != bill
              ? Icon(Icons.arrow_right, size: 64, color: Colors.grey)
              : Container()
        ],
      ),
    );
  }
}
